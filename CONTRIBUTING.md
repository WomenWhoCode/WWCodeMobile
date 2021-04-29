# Contributing Guidelines

First and foremost thanks for your contributions!!! :sparkling_heart::sparkling_heart:   

If you have resources you would like to share from your event or resources you think our community would benefit from keep reading!

## Pre-Reqs

1.  :book: Read up on fork & pull request models
2. 🍴 Fork this repo or pull from upstream to get the latest.  
3. 🔨 Follow the contributing guidelines below
4. 👥 Add yourself as a contributor under the credits section
5. 🔧 Make a pull request
6. 🎉 Get your pull request approved - success!

## Adding Event Resources

1. If there is a github repository with code to share run the following in your terminal.

    ```shell
    export REPO_URL="<FILL_ME_IN>"
    cd events
    git submodule add $REPO_URL
    ```
2. Upload the event graphic to the [images](docs/images) directory.

3. Copy and paste a new table entry **at the top** in the [README](README.md#event-resources). Fill in the applicable details. **Be sure to double check everything was updated.** Also be mindful of style and formatting.  



    ```markdown
    | <a href="REPO_URL"><img alt="EVENT_TITLE." align="center" width="400" src="docs/images/IMAGE_NAME"></a> | **EVENT_TITLE** <br/><br/> EVENT_DESCRIPTION <br/><br/> [Slides](SLIDE_LINK) <br/><br/> [Video Recording](VIDEO_LINK)<br/><br/> -SPEAKER_NAME, _SPEAKER_TITLE_ |
    ```



    a) Image `href` should point to `$REPO_URL` from _step 1_ (this could also be a link to slides if the speaker wanted to share those without a repo.)   

    b) Image `alt` should be the `EVENT_TITLE`  

    c) Image `src` should be the relative path to the uploaded image from _step 2_   

    d) Update the `EVENT_TITLE` in the description box    

    e) Update the `EVENT_DESCRIPTION` with zoom description  

    f) Update the `SLIDE_LINK` with url to slides (if speaker has shared) and `VIDEO_LINK` with the youtube url  

    g) Update the `SPEAKER_NAME` & `SPEAKER_TITLE`  




## Adding Other Resources

1. Create a new folder with a good descriptive name for the resources you are sharing.

2. Add a readme with details about what is being shared (description, links, etc)

3. If sharing code, be sure to first upload the coding project to your personal repo (we want your Github profile to get all the credit). Then link to the repo by running the following in your folder from _step 1_.

    ```shell
    #make sure you are in your directory - cd DIR_NAME
    export REPO_URL="<FILL_ME_IN>"
    git submodule add $REPO_URL
    ```
