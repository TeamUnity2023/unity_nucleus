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
    git clone git@github.com:rajivaPavan/unity_nucleus.git
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


___

## Development

Public url of the web app : `http://157.245.152.26:8000/`
___

### Branches

Shall we make the main branch protected?
___

## Deploying
