# Mantella-Local-Launcher
Status: Project being re-planned. Notice: Some of the details are somewhat inaccurate, at-least until the next release.

### Description
- a Launcher / Optimizer for Mantella with models locally on Windows. Determined how to correctly process the character files pre-launce, to the context, and thus, no modified game files are required for deployment, havent implemented it yet, but this part of the project then became the launcher. The Mantella xVASynth Optimizer/Launcher is a command-line tool designed to automate and optimize the workflow for managing audio generation in Skyrim and Fallout 4 using the xVASynth software. The script facilitates pre-launch, configuration management and optimization, launches, xVASynth and/or your chosen game, if it is not already running, then it launches Mantella, making use throughout of the re-configured settings in `config.ini`. Mantella-WT also performs various tasks such as, cleaning configuration files and optimizing the mantella prompts. The Batch file manages the, communication between and launching, of the relevant programs/scripts, while the Python component of the script handles the heavy work, and displays an interactive menu for user selection of game and optimization options. It all goes together, the launcher and optimizations are as important as the drop-in files. Currently the drop-in (replacer) files includes, concise/standardized characters sheet for Fo4/Vr & Skyrim/Vr, and also refinement of printed lines.
- Note, this project only currently supports LM Studio, however, it has been figured out to be possible to obtain the model folder, and am working on this.
- Note, this project will not replace the impressive new configuration interface coming in v12, but as a result of my launcher the user will probably just use that the first time.

# Features
1. **Batch Launcher for Automation**: Automates and runs xVASynth and Mantella with admin privileges.
2. **Standardized Character Details**: Standardizes character data for clarity and effective audio generation.
3. **Optimized Configuration Management**: Streamlines `config.ini` prompts and removes non-functional options.
4. **Interactive Python Script**: Cleans configuration files and offers an interactive menu for game and preset choices.
5. **Error Handling and Logging**: Tracks errors, logs execution, and backs up configuration files.
6. **Automatic Execution and Exit Handling**: If not already running, then runs, Fallout 4 and/or xVASynth, and then continues to Mantella for smooth operation.
7. **LM Studio Enhanced/Specific**: Switching models in LM Studio is detected, and then automatically updated in `config.ini`. 

# Preview
- The menu of much simplified optimization...
```
=======================================================================================================================
                                          Mantella-WT Optimizer / Launcher
-----------------------------------------------------------------------------------------------------------------------





                                               1. Game Used: Fallout4

                                               2 Microphone On: False

                                               3. Optimization: Regular

                                               4. Token Count: 4096





-----------------------------------------------------------------------------------------------------------------------

                                   model = Lewdiculous/L3-8B-Stheno-v3.2-GGUF-IQ-Imatrix
                                   Fallout4_folder = D:\GamesVR\Fallout4_163
                                   xvasynth_folder = D:\GamesVR\xVASynth

=======================================================================================================================
Selection, Program Options = 1-4, Refresh Display = R, Begin Mantella/xVASynth = B, Exit and Save = X:

```
- The general running of things...
```
=======================================================================================================================
                                          Mantella-xVASynth Optimizer/Launcher
------------------------------------------------------------------------------------------------------------------------

Working Dir: D:\GamesVR\Mantella-WT-0.11.4
Running Mantella xVASynth Optimizer...
Script started
Working Folder: D:\GamesVR\Mantella-WT-0.11.4
Config File: D:\GamesVR\Mantella-WT-0.11.4\config.ini
Script execution started
Entering main function
Starting config cleaning...
Found 0 comment lines.
Config Already Clean.
Checking Prompts
Prompts Alrady Optimized.
Reading config file...
Read Keys: config.ini.
Writing config file...
Settings saved. Proceeding to run Mantella/xVASynth...
Writing output file: exit_code=0, xvasynth_path=D:\GamesVR\xVASynth
Output file written successfully: main-wt.txt
0,D:\GamesVR\xVASynth
Final output: exit_code=0, xvasynth_path=D:\GamesVR\xVASynth
Script execution ended
...Mantella/xVASynth Optimizer-Launcher Closed...
Checking for xVASynth...
Running Mantella...
Mantella-WT for Mantella version 0.11.4
Mantella currently running for Fallout4 (D:\GamesVR\Fallout4_163).
Mantella mod located in D:\GamesVR\Fallout4_163\Data.
21:33:50.151 INFO: Running Mantella with local language model
21:33:50.152 WARNING: L3-8B-Stheno-v3.2-GGUF-IQ-Imatrix is using token_limit of 4096
21:33:50.361 TTS: Connecting to xVASynth...
21:33:50.510 STT: Audio threshold set to 'auto'. Adjusting microphone for ambient noise...
21:33:50.510 STT: If mic input too low, edit audio_threshold value manually in .\config.ini.
Need help? See here: https://art-from-the-machine.github.io/Mantella/pages/issues_qna
Waiting for player to select an NPC for Communication...

```

## Requirements
1. **Python Environment**: Requires Python 3.11 and dependencies from the Mantella requirements file.
2. **Language Model**: Use [Lewdiculous L3-8B-Stheno-v3.2-GGUF-IQ-Imatrix](https://huggingface.co/Lewdiculous/L3-8B-Stheno-v3.2-GGUF-IQ-Imatrix) with, Q3 for ~4GB and free quantization.
3. **Operating System**: Compatible with Windows 7 through Windows 11; administrative privileges may be needed.
4. **xVASynth Installation**: Must be installed and correctly configured in the specified directory.
5. **Configuration File**: Requires a `config.ini` with `Game`, `Paths`, and `LanguageModel.Advanced` sections.
6. **LM Studio**: Obtain model folder/name and foolproofs api config, Mantella-WT will not work on, Ollama or GPT.

# Usage / Install
1. Ensure the [Mantella Mod](https://www.nexusmods.com/fallout4/mods/79747) is installed for Fallout/Skyrim from the Nexus mods site, follow the guide, this will, at some point, require install [Mantella 11.4](https://github.com/art-from-the-machine/Mantella/releases/tag/v0.11.4) to a suitable directory.
2. After completing Mantella 11.4 install, then download the [Latest Release](https://github.com/wiseman-timelord/Mantella-Local-Launcher/releases) of the launcher, and copy the file(S) to the main Mantella folder, preserving any folders.
4. Ensure you have LM Studio loaded and configured and serving, and ensure to offload a suitable number of layers to the GPU depending upon free VRAM. Ollama support is coming later.
5. Configure the ".\config.ini", ensure you have entered things like, "fallout4_folder" and "fallout4_mod_folder" and "llm_api" and "tts_service".
6. Run `Mantella-Local-Launcher.Bat` batch, the "config.ini" will be cleaned/backup, and then you will be presented with the menu.
- Hopefully you have, Admin rights and sensible system settings, but click allow on firewall as required, I am guessing its the interaction between Mantella and the Mantella Mod.

## Notes
- all options for Optimization are shown...
```
Default: max_tokens = 250, max_response_sentences = 999, temperature = 1
Faster: max_tokens = 100,max_response_sentences = 1, temperature = 0.4
Medium: max_tokens = 150, max_response_sentences = 2, temperature = 0.5
Quality: max_tokens = 200, max_response_sentences = 3, temperature = 0.6
```
- the "Offended" and "Forgiven", commands are removed from the prompts, prompts are made concise this is because, offended will depend on the model, and most likely on local models, asking for forgiveness would not have a result before the player is dead? So, I find these things a nice idea, but a bit naff. I would prefer commands like "Attack" and "Hold Back", to switch between, Aggressive and Cautious. Either way, it was additional weight, and I wanted the prompts to work, correctly and fast, on Q3_M Local Models.
- a Llama 3 Q3_m model with fallout 4 dlc & ~300 mods including PhyOp performance texture pack, utilizes all of the 8GB on a single card, if you want to use =>Q4 and/or hd textures, then I suggest 10-12GB free VRam or, sharing processing with the cpu. If you need more VRam, try the "PhyOp" Performance/Regular Textures on Nexus, ensure it loads after things like, for example, CBBE and BodyTalk.
- No GPT/Online support! Despite loving GPT for other things, GPT will always be filtered response, despite being fast. I cant see it being used when there are local models able to produce SFW AND NSFW contents in one model and process text, I consider, Fallout4 and Skyrim, to be *Ahem* Offline Games with a little tweaking, unless you have like of achievements otherwise known as character profiling. 
- Possibly requires advance of my project for utilizing llama.cpp pre-compiled binaries for vulkan, to host models with OhLlama/LmStudio compatibility for apps, as they are not utilizing threads properly or vulkan at all, currently.

# Development
- Complete Mantella-WT-0.11.4.5.1 then re-brand and process into exe, upload to nexus.
Ollama has no curl model folder/name request, I am trying things, apparently
- Its looking likely, I have determined how to correctly process the character files pre-launce, to the context, and thus, no modified game files are required for deployment, this then becomes the launcher. so the forked files would be gone. it would become a standalone exe, it will be put on, Github repository and nexus, as Mantella-Launcher.
1. last thing from the original outline: develop my program to standardize the character csv files, it needs to generate 3 files, 1/2/3 sentence versions, that will be used, relevantly and dynamically, with the context lengths of, 2048, 4096, 8192. What would be simpler is, I could rename the files, ie "gamename_characters.bak", then process it according to the current context settings for context, and over-write any existing csv file in the same dir, so as, to not need a bunch of modifications to, 3 scripts to make them dynamic.
2. Ollama does not have a curl requires, but we know it running or not by "ollama.exe". From command "Ollama Ps", we can find this...
```
NAME                    ID              SIZE    PROCESSOR       UNTIL
qwen2_57b:latest        9dbf41c98d9e    48 GB   100% CPU        4 minutes from now
```
...there is the model name, so we can search the host computer for "qwen2_57b", to find the folder it is in, it will stop on the first one it finds. I would think, that commonly, people would have their models in one location, not duplicated. If we can implement this, then Mantella-Local will be able to support ALL local features. Obviously, it should first check if both Ollama AND LM Studio are running, and if so, then ask the user to choose which one they are using. If multiple models are hosted on ollama/lm studio, then the user should be prompted to choose.
3. requires re-assessment of what is a "Required number of Tokens" for llama 3 level, as noticed it was generating at 1 token per word.
4. Launcher GUI.


# Disclaimer
- To be detailed.
