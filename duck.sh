#!/bin/bash

generate_css() {
    background_image="$1"
    text_color="$2"
    selection_color="$3"
    text_shadow="$4"

    cat <<EOL
define("ace/theme/tomorrow_night", ["require", "exports", "module", "ace/lib/dom"], function(e, t, n) {
  t.isDark = !0;
  t.cssClass = "ace-tomorrow_night-theme";
  t.cssText = \`
    .ace-tomorrow_night-theme .ace_gutter {
      background: transparent;
      color: ${text_color};  
    }
    
    .ace-tomorrow_night-theme .ace_print-margin {
      width: 1px;
      background: transparent;
    }
    
    .ace-tomorrow_night-theme {
      background: url('${background_image}') no-repeat center center fixed;
      background-size: cover;
      color: #ede8e8; 
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
      color: ${text_color}; 
    }
    
    .ace-tomorrow_night-theme .ace_keyword.ace_operator {
      color: ${text_color}; 
    }
    
    .ace-tomorrow_night-theme .ace_constant.ace_character,
    .ace-tomorrow_night-theme .ace_constant.ace_language,
    .ace-tomorrow_night-theme .ace_constant.ace_numeric,
    .ace-tomorrow_night-theme .ace_keyword.ace_other.ace_unit,
    .ace-tomorrow_night-theme .ace_support.ace_constant,
    .ace-tomorrow_night-theme .ace_variable.ace_parameter {
      color: ${text_color};  
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
      text-shadow: 
        -0.8px -0.8px 0 #732921,
        0.7px -0.8px 0 #732921,
        -0.8px 0.8px 0 #732921,
        0.8px 0.8px 0 #732921;
    }
  \`;
  
  var r = e("../lib/dom");
  r.importCssString(t.cssText, t.cssClass);
});
EOL
}

install_theme() {
    local theme_directory="/Applications/MacSploit.app/Contents/Resources/CodeViewer_CodeViewer.bundle/Contents/Resources/ace.bundle"
    cd "$HOME/Downloads" || exit 1
    custom_macsploit_theme="custom_macsploit_theme.js"
    theme_tomorrow_night="theme-tomorrow_night.js"
    if [ -e "$custom_macsploit_theme" ]; then
        mv "$custom_macsploit_theme" "$theme_tomorrow_night"
        mv "$theme_tomorrow_night" "$theme_directory"
        echo "Your theme has been installed! Enjoy! - ZackDaQuack"
    else
        echo "The theme file does not exist! Make sure you didn't rename or delete it!"
        exit 1
    fi
}

echo ""
echo "Welcome to:"
echo "________                       __            "
echo "\\_____  \\  __ _______    ____ |  | _________ "
echo " /  / \\  \\|  | \\__  \\ _/ ___\\|  |/ /\\_  __ \\"
echo "/   \\_/.  \\  | \\/ __ \\\\  \\___|    <  |  | \\/"
echo "\\______\\ \\_/____/(____  /\\___  >__|_ \\|__|   "
echo "       \\__>          \\/     \\/     \\/         "
echo ""
echo "DIY custom theme creator for Macsploit! Made by ZackDaQuack!"
echo ""
echo ""

read -p "Select your mode: Create (C) or Install (I): " smode

if [ "$smode" == "C" ] || [ "$smode" == "c" ]; then
    read -p "Add your background image link: " bgimg
    read -p "What color do you want the text to be? (HEX ONLY!): " txtclr
    read -p "What color do you want the text selected to be? (HEX ONLY!): " stxtclr
    read -p "What color do you want the text shadow to be? (HEX ONLY!): " txtsha

    generate_css "$bgimg" "$txtclr" "$stxtclr" "$txtsha" > "$HOME/Downloads/custom_macsploit_theme.js"
    echo "CSS code has been saved to Downloads as 'custom_macsploit_theme.js'"

    read -p "Would you like to install your theme now? (Y/N): " ain
    if [ "$ain" == "Y" ] || [ "$ain" == "y" ]; then
        install_theme
    fi

elif [ "$smode" == "I" ] || [ "$smode" == "i" ]; then
    install_theme
else
    echo "Mode not recognized! Rerun the script and select a valid mode!"
fi
