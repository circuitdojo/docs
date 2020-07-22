.POSIX:

OPTIMIZED_DIR := optimized
DEST_DIR := book

SERVER := 159.65.226.127
USER := root
TARGET := docs
CONTENT_DIR := src

# Full path
DEPLOY_DIR := /usr/local/bastille/jails/caddy/root/var/www/$(TARGET).jaredwolff.com

IMAGES := \
	$(wildcard $(CONTENT_DIR)/img/*.jpg) \
	$(wildcard $(CONTENT_DIR)/img/*.JPG) \
	$(wildcard $(CONTENT_DIR)/img/*.jpeg) \
	$(wildcard $(CONTENT_DIR)/img/*.png) \
	$(wildcard $(CONTENT_DIR)/*/img/*.jpg) \
	$(wildcard $(CONTENT_DIR)/*/img/*.jpeg) \
	$(wildcard $(CONTENT_DIR)/*/img/*.png) \
	$(wildcard $(CONTENT_DIR)/*/img/*.JPG) \

OPTIMIZED_IMAGES := \
	$(subst $(CONTENT_DIR)/,$(OPTIMIZED_DIR)/,$(IMAGES))

.PHONY: all
all: build optimize

.PHONY: clean
clean:
	rm -rf $(DEST_DIR)/
	rm -rf $(OPTIMIZED_DIR)/

.PHONY: serve
serve:
	mdbook serve

.PHONY: ssh
ssh:
	@ssh $(USER)@$(SERVER)

.PHONY: build
build:
	@echo "🍳 Generating site"
	@echo $(IMAGES)
	mdbook build
	rsync -av --del -f"+ */" -f"- *" $(CONTENT_DIR)/ $(OPTIMIZED_DIR)/

.PHONY: optimize
optimize: build $(OPTIMIZED_IMAGES)
	@echo "🧂 Optimizing images"
	rsync -r $(OPTIMIZED_DIR)/ $(DEST_DIR)/
	du -sh $(CONTENT_DIR)/
	du -sh $(DEST_DIR)/

$(OPTIMIZED_IMAGES):
	convert -strip -compress JPEG -resize '730>' $(subst $(OPTIMIZED_DIR)/,$(CONTENT_DIR)/,$@) $@

.PHONY: deploy
deploy: all
	@echo rsync to $(DEPLOY_DIR)
	@ssh $(USER)@$(SERVER) mkdir -p $(DEPLOY_DIR)
	@rsync -zr --del $(DEST_DIR)/ $(USER)@$(SERVER):$(DEPLOY_DIR)/
	@echo "🚀 Docs are deployed!"