import os
import platform

def generate_css(background_image, text_color_main, text_color_while, text_color_equal, text_color_true, text_shadow,
                 selection_color):
    css_text = f"""
define("ace/theme/tomorrow_night", ["require", "exports", "module", "ace/lib/dom"], function(e, t, n) {{
  t.isDark = true;
  t.cssClass = "ace-tomorrow_night-theme";
  t.cssText = \\
    .ace-tomorrow_night-theme .ace_gutter {{
      background: transparent;
      color: {text_color_main};
    }}
    .ace-tomorrow_night-theme .ace_print-margin {{
      width: 1px;
      background: transparent;
    }}
    .ace-tomorrow_night-theme {{
      background: url('{background_image}') no-repeat center center fixed;
      background-size: cover;
      color: {text_color_main};
      text-shadow: {text_shadow};
      border: #edebeb;
    }}
    .ace-tomorrow_night-theme .ace_marker-layer {{
      background: transparent;
    }}
    .ace-tomorrow_night-theme .ace_selection {{
      background-color: {selection_color};
    }}
    .ace-tomorrow_night-theme.ace_multiselect .ace_selection.ace_start {{
      box-shadow: none;
    }}
    .ace-tomorrow_night-theme .ace_step {{
      background: transparent;
    }}
    .ace-tomorrow_night-theme .ace_bracket {{
      background: transparent;
    }}
    .ace-tomorrow_night-theme .ace_bracket-start {{
      background: transparent;
    }}
    .ace-tomorrow_night-theme .ace_bracket-unmatched {{
      margin: -1px 0 0 -1px;
      border: none;
    }}
    .ace-tomorrow_night-theme .ace_active-line {{
      background: transparent;
    }}
    .ace-tomorrow_night-theme .ace_gutter-active-line {{
      background-color: transparent;
    }}
    .ace-tomorrow_night-theme .ace_selected-word {{
      border: none;
      background-color: {selection_color};
    }}
    .ace-tomorrow_night-theme .ace_invisible {{
      color: transparent;
    }}
    .ace-tomorrow_night-theme .ace_keyword,
    .ace-tomorrow_night-theme .ace_meta,
    .ace-tomorrow_night-theme .ace_storage,
    .ace-tomorrow_night-theme .ace_storage.ace_type {{
      color: {text_color_while};
    }}
    .ace-tomorrow_night-theme .ace_keyword.ace_operator {{
      color: {text_color_equal};
    }}
    .ace-tomorrow_night-theme .ace_constant.ace_character,
    .ace-tomorrow_night-theme .ace_constant.ace_language,
    .ace-tomorrow_night-theme .ace_constant.ace_numeric,
    .ace-tomorrow_night-theme .ace_keyword.ace_other.ace_unit,
    .ace-tomorrow_night-theme .ace_support.ace_constant,
    .ace-tomorrow_night-theme .ace_variable.ace_parameter {{
      color: {text_color_true};
    }}
    .ace-tomorrow_night-theme .ace_constant.ace_other {{
      color: {text_color_main};
    }}
    .ace-tomorrow_night-theme .ace_invalid {{
      color: {text_color_main};
      background-color: transparent;
    }}
    .ace-tomorrow_night-theme .ace_invalid.ace_deprecated {{
      color: {text_color_main};
      background-color: transparent;
    }}
    .ace-tomorrow_night-theme {{

    }};

  var r = e("../lib/dom");
  r.importCssString(t.cssText, t.cssClass);
}});
"""

    return css_text


def get_valid_hex_color(message):
    while True:
        hex_color = input(message)
        if hex_color.startswith("#") and (len(hex_color) == 7 or len(hex_color) == 4) and all(
                c in "0123456789ABCDEFabcdef" for c in hex_color[1:]):
            break
        else:
            print("\033[31mInvalid hexadecimal color code. Please try again.\033[0m")
    return hex_color


def install_theme():
    if platform.system() == "Windows":
        print("You are currently on Windows. You can't install Macsploit themes here lol.")
        exit()
    elif platform.system() == "Linux":
        print("Nice a Linux user! Sorry, but Macsploit is MacOS only.")
        exit()
    else:
        theme_directory = "/Applications/MacSploit.app/Contents/Resources/CodeViewer_CodeViewer.bundle/Contents/Resources/ace.bundle"
        os.chdir(os.path.expanduser("~/Downloads"))

        custom_macsploit_theme = "macsploit_theme_zackdaquack.js"
        theme_tomorrow_night = "theme-tomorrow_night.js"

        if os.path.exists(custom_macsploit_theme):
            os.rename(custom_macsploit_theme, theme_tomorrow_night)
            os.rename(theme_tomorrow_night, theme_directory)
            print("\033[32mYour theme has been installed! Enjoy! - ZackDaQuack\033[0m")
            print("")
        else:
            print("\033[31mThe theme file does not exist! Make sure you didn't rename or delete it! *sad quack*\033[0m")
            print("")
            exit()


print("\033[32m")
print("Welcome to:")
print("________                       __            ")
print("\\_____  \\  __ _______    ____ |  | _________ ")
print(" /  / \\  \\|  | \\__  \\ _/ ___\\|  |/ /\\_  __ \\")
print("/   \\_/.  \\  | \\/ __ \\\\  \\___|    <  |  | \\/")
print("\\______\\ \\_/____/(____  /\\___  >__|_ \\|__|   ")
print("       \\__>          \\/     \\/     \\/         ")
print("(Python Edition)                            v1.1")
print("DIY custom theme creator for Macsploit! Made by \033[33mZackDaQuack\033[0m!")
print("")
print("")

input("\033[32mPress Enter!\033[0m\n")
print("")

smode = input("Select your mode: Create (C) or Install (I): ")
print("")

if smode.lower() == "c":
    bgimg = input("Add your background image link: ")
    text_color_main = get_valid_hex_color("What color do you want the text to be? (main text): ")
    text_color_while = get_valid_hex_color("What color do you want the text to be? (while, do, end, etc): ")
    text_color_equal = get_valid_hex_color("What color do you want the text to be? (= sign): ")
    text_color_true = get_valid_hex_color("What color do you want the text to be? (true and false): ")
    text_shadow = get_valid_hex_color("What color do you want the text shadow to be?: ")
    selection_color = get_valid_hex_color("What color do you want the text selected to be?: ")

    css_content = generate_css(bgimg, text_color_main, text_color_while, text_color_equal, text_color_true, text_shadow,
                               selection_color)

    with open(os.path.expanduser("~/Downloads/macsploit_theme_zackdaquack.js"), "w") as css_file:
        css_file.write(css_content)

    print("\033[32mTheme has been saved to Downloads as 'macsploit_theme_zackdaquack.js'\033[0m")

    ain = input("Would you like to install your theme now? (Y/N): ")
    if ain.lower() == "y":
        install_theme()

elif smode.lower() == "i":
    install_theme()

else:
    print("\033[31mMode not recognized! Rerun the script and select a valid mode!\033[0m")
    print("")
