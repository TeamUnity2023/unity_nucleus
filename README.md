# Nucleus 
<p align="center">
    <picture>
      <source 
        srcset="https://github.com/TeamUnity2023/unity_nucleus/blob/frontend/banner.png"
        media="(prefers-color-scheme: dark)"
      />
      <img 
        src="https://github.com/TeamUnity2023/unity_nucleus/blob/frontend/banner.png" 
        alt="Academease Preview"
        width="800"
       />
    </picture>
  </p>
  
## Contents
- [Project Setup](#project-setup)
  - [Backend](#backend-env-setup)
  - [Frontend](#frontend-env-setup)
- [Development](#development)
  - [Branches](#branches)
- [Deploying](#deploying)
___

## Project Setup

### Backend  

Recommended Python version : `Python 3.10.12`
  
Please develop the backend in a virtual environment.

   
1) First, clone the repository. 
    
    ```bash
    git clone https://github.com/TeamUnity2023/unity_nucleus.git
    ```

2) Then run this command to activate a python environment. After that activate the environment. 

    In Unix
    ```bash
    virtualenv --python=python3 ~/venv/MyVirtEnv
    source ~/venv/MyVirtEnv/bin/activate
    ```

    In Windows,
    ```bash
    python -m venv "nucleus"
    nucleus\Scripts\activate
    ```

    If your Python virtual environment works fine, then in the command line should be something similar to this.
    
    ```bash
    (nucleus) C:\Users\Foo
    ```

3) Now you have to install the required python libraries. Then run this command.

    ```bash
    pip install -r requirements.txt
    ```

4) Run this command to run the local server

    ```bash
    python manage.py runserver
    ```

5) Use `deactivate` command to close the virtual environment.
___

### Frontend

Recommended Flutter version : `3.10.6` <br>
Recommended  Dart SDK versions : `>=3.0.6 <4.0.0`

1) Assuming that you have already cloned the repository, Open the `frontend` directory in the flutter environment. To get the dependencies, run Following command in the terminal. (You should be in the `frontend` directory.)

     ```bash
    flutter pub get
    ```
     
2) Now you have to build the app by running the relevant command.

    * For Android
    ```bash
    flutter build apk
    ```

    * For IOS
    ```bash
    flutter build ios
    ```

    * For Windows
    ```bash
    flutter build windows
    ```

    * For MacOS
    ```bash
    flutter build macos
    ```

    * For Linux
    ```bash
    flutter build linux
    ```

     * For Web
    ```bash
    flutter build web
    ```
    
    3) After running above commands succesfully, you will able to locate the executable in the following paths : <br>
        * Android : `build/app/outputs/flutter-apk/`
        * IOS : `build/ios/`
        * Windows : `build/windows`
        * MacOS : `build/macos/Build/Products/Release/`
        * Linux : `build/linux/`

        * For Web, you can run the project by running the following command :
        ```bash
        flutter run -d web
        ```


