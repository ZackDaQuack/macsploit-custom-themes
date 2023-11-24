#!/bin/bash

generate_css() {
    args=("$@")

    cat <<EOL
define("ace/theme/tomorrow_night", ["require", "exports", "module", "ace/lib/dom"], function(e, t, n) {
    t.isDark = !0;
    t.cssClass = "ace-tomorrow_night-theme";
    t.cssText = ".ace-tomorrow_night-theme .ace_gutter {color: ${args[12]};}" +
        ".ace-tomorrow_night-theme .ace_print-margin {width: 1px;background: #A9B7C6;}" +
        ".ace-tomorrow_night-theme {background: url('${args[0]}') no-repeat center center fixed;background-size: cover;color: ${args[1]}; text-shadow: ${args[6]};border: #8080B7;}" +
        ".ace-tomorrow_night-theme .ace_entity.ace_other.ace_attribute-name," +
        ".ace-tomorrow_night-theme .ace_storage {color: ${args[3]};}" +
        ".ace-tomorrow_night-theme .ace_cursor {color: ${args[9]};}," +
        ".ace-tomorrow_night-theme .ace_string.ace_regexp {color: #bf616a;}" +
        ".ace-tomorrow_night-theme .ace_marker-layer .ace_active-line {background: ${args[10]}cc;}" +
        ".ace-tomorrow_night-theme .ace_marker-layer .ace_selection {background: ${args[11]}cc;}" +
        ".ace-tomorrow_night-theme.ace_multiselect .ace_selection.ace_start {box-shadow: 0 0 3px 0px #2e3440;}" +
        ".ace-tomorrow_night-theme .ace_marker-layer .ace_step {background: #ebcb8b;}" +
        ".ace-tomorrow_night-theme .ace_marker-layer .ace_bracket {margin: -1px 0 0 -1px;border: 1px solid ${args[8]}66;}" +
        ".ace-tomorrow_night-theme .ace_gutter-active-line {background-color: ${args[10]}cc;}" +
        ".ace-tomorrow_night-theme .ace_marker-layer .ace_selected-word {border: 1px solid ${args[11]}66;}" +
        ".ace-tomorrow_night-theme .ace_invisible {color: #4c566a;}" +
        ".ace-tomorrow_night-theme .ace_keyword, .ace-tomorrow_night-theme .ace_meta, .ace-tomorrow_night-theme .ace_support.ace_class, .ace-tomorrow_night-theme .ace_support.ace_type {color: ${args[4]};}" +
        ".ace-tomorrow_night-theme .ace_constant.ace_character, .ace-tomorrow_night-theme .ace_constant.ace_other {color: #d8dee9;}" +
        ".ace-tomorrow_night-theme .ace_constant.ace_language {color: #BB7031;}" +
        ".ace-tomorrow_night-theme .ace_constant.ace_escape {color: #ebcB8b;}" +
        ".ace-tomorrow_night-theme .ace_constant.ace_numeric {color: ${args[5]};}" +
        ".ace-tomorrow_night-theme .ace_fold {background-color: #4c566a;border-color: #d8dee9;}" +
        ".ace-tomorrow_night-theme .ace_entity.ace_name.ace_function, .ace-tomorrow_night-theme .ace_entity.ace_name.ace_tag, .ace-tomorrow_night-theme .ace_support.ace_function, .ace-tomorrow_night-theme .ace_variable, .ace-tomorrow_night-theme .ace_variable.ace_language {color: ${args[7]};}" +
        ".ace-tomorrow_night-theme .ace_string {color: ${args[2]};}" +
        ".ace-tomorrow_night-theme .ace_comment {color: ${args[13]};}" +
        ".ace-tomorrow_night-theme .ace_indent-guide {box-shadow: inset -1px 0 0 0 #434c5eb3;}";
    
    t.\$selectionColorConflict = !0;

    var r = e("../lib/dom");
    r.importCssString(t.cssText, t.cssClass);
});

(function () {
    window.require(["ace/theme/nord_dark"], function (m) {
        if (typeof module == "object" && typeof exports == "object" && module) {
            module.exports = m;
        }
    });
})();
EOL
}


get_valid_hex_color() {
  message="$1"
  while true; do
      read -p "$message" hex_color
      if [[ "$hex_color" =~ ^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})$ ]]; then
          break
      else
        read -p $'\e[31mInvalid hexadecimal color code. Please try again.\e[0m' bruh
      fi
  done
  echo "$hex_color"
}

install_theme() {
    local theme_directory="/Applications/MacSploit.app/Contents/Resources/CodeViewer_CodeViewer.bundle/Contents/Resources/ace.bundle"
    cd "$HOME/Downloads" || exit 1
    custom_macsploit_theme="macsploit_theme_zackdaquack.js"
    theme_tomorrow_night="theme-tomorrow_night.js"
    if [ -e "$custom_macsploit_theme" ]; then
        mv "$custom_macsploit_theme" "$theme_tomorrow_night"
        mv "$theme_tomorrow_night" "$theme_directory"
        echo "$(tput setaf 2)Your theme has been installed! Enjoy! - ZackDaQuack$(tput sgr0)"
        echo ""
    else
        echo "$(tput setaf 1)The theme file does not exist! Make sure you didn't rename or delete it! *sad quack*$(tput sgr0)"
        echo ""
        exit 1
    fi
}

echo "$(tput setaf 2)"
echo "Welcome to:"
echo "________                       __            "
echo "\\_____  \\  __ _______    ____ |  | _________ "
echo " /  / \\  \\|  | \\__  \\ _/ ___\\|  |/ /\\_  __ \\"
echo "/   \\_/.  \\  | \\/ __ \\\\  \\___|    <  |  | \\/"
echo "\\______\\ \\_/____/(____  /\\___  >__|_ \\|__|   "
echo "       \\__>          \\/     \\/     \\/         "
echo "                                        v1.2"
echo "DIY custom theme creator for Macsploit! Made by $(tput setaf 3)ZackDaQuack$(tput sgr0)!"
echo ""
echo ""

read -p $'\e[32mPress Enter!\e[0m' idk
echo ""
read -p "Select your mode: Create (C) or Install (I): " smode
echo ""

if [ "$smode" == "C" ] || [ "$smode" == "c" ]; then

    read -p "Add your background image link (blank if none): " bgimg
    text_color_main=$(get_valid_hex_color "What color do you want the text to be? (main text): ")
    text_color_string=$(get_valid_hex_color "What color do you want the text string to be? ("hello world"): ")
    storage=$(get_valid_hex_color "What color do you want the text storage to be? (storage varraibles): ")
    key_word=$(get_valid_hex_color "What color do you want the text key word to be? (while, do, end): ")
    num_color=$(get_valid_hex_color "What color do you want the numbers to be? (1, 2, 3): ")
    text_shadow=$(get_valid_hex_color "What color do you want the text shadow to be?: ")
    var_func=$(get_valid_hex_color "What color do you want the varriables and functions to be? (local function): ")
    bracket=$(get_valid_hex_color "What color do you want the brackets to be? (zack = {}): ")
    cursor=$(get_valid_hex_color "What color do you want the cursor to be? (typing bar thing): ")
    active_line=$(get_valid_hex_color "What color do you want the active line to be? (bar on active line): ")
    selection_color=$(get_valid_hex_color "What color do you want the text selected to be? (selection): ")
    line_number=$(get_valid_hex_color "What color do you want the line number to be? (numbers that shows what line): ")
 
    generate_css "$bgimg" "$text_color_main" "$text_color_string" "$storage" "$key_word" "$num_color" "$text_shadow" "$var_func" "$bracket" "$cursor" "$active_line" "$selection_color" "$line_number" > "$HOME/Downloads/macsploit_theme_zackdaquack.js"
    echo "$(tput setaf 2)Theme has been saved to Downloads as 'macsploit_theme_zackdaquack.js'$(tput sgr0)"
  
    read -p "Would you like to install your theme now? (Y/N): " ain
    if [ "$ain" == "Y" ] || [ "$ain" == "y" ]; then
        install_theme
    fi

elif [ "$smode" == "I" ] || [ "$smode" == "i" ]; then
    install_theme
else
    echo "$(tput setaf 1)Mode not recognized! Rerun the script and select a valid mode!$(tput sgr0)"
    echo ""
fi
