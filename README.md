# Principles of Programming test and exam deployment

These instructions are designed to deploy a Principles of Programming exam
environment on an Imperial College London ICT-managed Windows system.

## Start Git and VS Code

Use the Software Hub to launch Git, and Visual Studio Code. Just leave Git
running in the background, we will access it via VS Code.

## Run the deployment script

There is a [GitHub
repository](https://github.com/object-oriented-python/pop_exam_config)
containing a Python package, a Visual Studio Workspace, and a deployment
script. Running the deployment script requires network access to GitHub.com.
This is not required during the exam.

Open the Visual Studio Code window. If the terminal is not visible at the
bottom of the screen, drag up the bottom bar to reveal it. You now need to
launch a Git Bash terminal. Use the down arrow to the right of the `+` in the
bar at the top of the terminal to access this option. The new terminal will be
recognisable by the `$` Bash prompt in place of the `>` Powershell prompt.

In the terminal, run
the following command to download and execute the deployment script:

```console
curl https://raw.githubusercontent.com/object-oriented-python/pop_exam_config/main/setup_exam.sh | bash
```

This will:

 - create a folder called `pop_exam`
 - clone the `pop_exam_config` repository.
 - set up a Python venv called `PoP_venv`
 - install the `pop_exam_config` Python package, hence installing all the
   required Python packages.

## Deploy the exam paper

Copy the folder containing the exam materials to the name `exam_paper` in the
`pop_exam` folder.

## Launch the exam workspace.

In Visual Studio Code, open `pop_exam/pop_exam_config/PoP_exam.code-workspace`.

Next, click on the blue button at the bottom right of the editor window to open
the workspace.

When prompted, agree to trust the files in the workspace. 

When prompted, agree to install the Flake8 extension.

# Testing the installation

This section is specific to testing with the 2023 exam repository.

In the Visual Studio Code PoP_exam workspace, open a Bash terminal (same
procedure as above). Activate the Virtual environment:

```console
source ../PoP_venv/Scripts/activate
```

Change to the reference solutions branch of the exam paper:

```console
git checkout reference_solution
```

Run the tests provided:
```console
python -m pytest
```

The expected output is 71 passing tests:
```console
======================================================== test session starts =========================================================
platform win32 -- Python 3.11.4, pytest-7.4.1, pluggy-1.3.0
rootdir: C:\Users\dham\pop_exam\exam_paper
configfile: pytest.ini
collected 71 items

tests\test_q1.py ..................................                                                                             [ 47%]
tests\test_q2.py ............                                                                                                   [ 64%]
tests\test_q3.py ............                                                                                                   [ 81%]
tests\test_q4.py .............                                                                                                  [100%]

========================================================= 71 passed in 1.12s ========================================================= 
```