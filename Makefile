LOCAL_DIST_DIR=$(shell pwd)
FACEBOOK_EMAIL=$(shell . ./setenv.sh;printenv FACEBOOK_EMAIL)
FACEBOOK_PASS=$(shell . ./setenv.sh;printenv FACEBOOK_PASS)
FACEPP_API_KEY=$(shell . ./setenv.sh;printenv FACEPP_API_KEY)
FACEPP_API_SECRETKEY=$(shell . ./setenv.sh;printenv FACEPP_API_SECRETKEY)

.DEFAULT_GOAL := build

.PHONY: build
build :
	python3 ./compile.py clean build develop

.PHONY: run
run :
	export LANG='ja_JP.UTF-8';export LC_ALL='ja_JP.UTF-8';python3 ./hacking_tinder/main/hacking_tinder.py $(FACEBOOK_EMAIL) $(FACEBOOK_PASS) $(FACEPP_API_KEY) $(FACEPP_API_SECRETKEY)

.PHONY: test
test :
	python3 ./hacking_tinder/test/test_access_token.py $(FACEBOOK_EMAIL) $(FACEBOOK_PASS)
	python3 ./hacking_tinder/test/test_beauty_score.py $(FACEPP_API_KEY) $(FACEPP_API_SECRETKEY)
