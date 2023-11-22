#!/bin/bash

generate_css() {
    background_image="$1"
    text_color_main="$2"
    text_color_while="$3"
    text_color_equal="$4"
    text_color_true="$5"
    text_shadow="$6"
    selection_color="$7"

    cat <<EOL
define("ace/theme/tomorrow_night", ["require", "exports", "module", "ace/lib/dom"], function(e, t, n) {
  t.isDark = !0;
  t.cssClass = "ace-tomorrow_night-theme";
  t.cssText = \`
    .ace-tomorrow_night-theme .ace_gutter {
      background: transparent;
      color: ${text_color_main};  
    }
    
    .ace-tomorrow_night-theme .ace_print-margin {
      width: 1px;
      background: transparent;
    }
    
    .ace-tomorrow_night-theme {
      background: url('${background_image}') no-repeat center center fixed;
      background-size: cover;
      color: ${text_color_main};
      text-shadow: ${text_shadow};
      border: #edebeb;
    }
    
    .ace-tomorrow_night-theme .ace_marker-layer {
      background: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_selection {
      background-color: ${selection_color};
    }
    
    .ace-tomorrow_night-theme.ace_multiselect .ace_selection.ace_start {
      box-shadow: none;
    }
    
    .ace-tomorrow_night-theme .ace_step {
      background: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_bracket {
      background: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_bracket-start {
      background: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_bracket-unmatched {
      margin: -1px 0 0 -1px;
      border: none;
    }
    
    .ace-tomorrow_night-theme .ace_active-line {
      background: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_gutter-active-line {
      background-color: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_selected-word {
      border: none;
      background-color: ${selection_color};
    }
    
    .ace-tomorrow_night-theme .ace_invisible {
      color: transparent;
    }
    
    .ace-tomorrow_night-theme .ace_keyword,
    .ace-tomorrow_night-theme .ace_meta,
    .ace-tomorrow_night-theme .ace_storage,
    .ace-tomorrow_night-theme .ace_storage.ace_type {
      color: ${text_color_while};
    }
    
    .ace-tomorrow_night-theme .ace_keyword.ace_operator {
      color: ${text_color_equal};
    }
    
    .ace-tomorrow_night-theme .ace_constant.ace_character,
    .ace-tomorrow_night-theme .ace_constant.ace_language,
    .ace-tomorrow_night-theme .ace_constant.ace_numeric,
    .ace-tomorrow_night-theme .ace_keyword.ace_other.ace_unit,
    .ace-tomorrow_night-theme .ace_support.ace_constant,
    .ace-tomorrow_night-theme .ace_variable.ace_parameter {
      color: ${text_color_true};
    }
    
    .ace-tomorrow_night-theme .ace_constant.ace_other {
      color: ${text_color};
    }
    
    .ace-tomorrow_night-theme .ace_invalid {
      color: ${text_color};
      background-color: transparent;
    }
    .ace-tomorrow_night-theme .ace_invalid.ace_deprecated {
      color: ${text_color};
      background-color: transparent;
    }
    
    .ace-tomorrow_night-theme {
      
    }
  \`;
  
  var r = e("../lib/dom");
  r.importCssString(t.cssText, t.cssClass);
});
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
echo "                                        v1.1"
echo "DIY custom theme creator for Macsploit! Made by $(tput setaf 3)ZackDaQuack$(tput sgr0)!"
echo ""
echo ""

read -p $'\e[32mPress Enter!\e[0m' idk
echo ""
read -p "Select your mode: Create (C) or Install (I): " smode
echo ""

if [ "$smode" == "C" ] || [ "$smode" == "c" ]; then

    read -p "Add your background image link: " bgimg
    text_color_main=$(get_valid_hex_color "What color do you want the text to be? (main text): ")
    text_color_while=$(get_valid_hex_color "What color do you want the text to be? (while, do, end, etc): ")
    text_color_equal=$(get_valid_hex_color "What color do you want the text to be? (= sign): ")
    text_color_true=$(get_valid_hex_color "What color do you want the text to be? (true and false): ")
    text_shadow=$(get_valid_hex_color "What color do you want the text shadow to be?: ")
    selection_color=$(get_valid_hex_color "What color do you want the text selected to be?: ")
    generate_css "$bgimg" "$text_color_main" "$text_color_while" "$text_color_equal" "$text_color_true" "$text_shadow" "$selection_color" > "$HOME/Downloads/macsploit_theme_zackdaquack.js"
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
