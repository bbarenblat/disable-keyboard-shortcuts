# Copyright 2019 Google LLC
# Copyright 2021 Benjamin Barenblat
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

NAME = disable_keyboard_shortcuts

$(NAME).zip: background.js manifest.json icon128.png icon48.png
	mkdir $(NAME)
	uglifyjs background.js -m -o $(NAME)/background.js
	jq -Sc . manifest.json >$(NAME)/manifest.json
	cp -al icon128.png icon48.png $(NAME)
	zip -9r $(NAME) $(NAME)
	$(RM) -r $(NAME)

.PHONY: clean
clean:
	$(RM) -r $(NAME).zip $(NAME)
