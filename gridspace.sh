function zensh {
    cd ~/vm/dossier/zenapi;
    workon zenapi;
    python manage.py shell
}


function kusleep {
    kusd botweb 0
    kusd celerybeat 0
    kusd cloudsqlproxy 0
    kusd dialogmanager 0
    kusd wordembedding 0
    kusd eventlistener 0
    kusd interactionmanager 0
    kusd taskbotdefault 0
    kusd taskdefault 0
    kusd taskfastlane 0
    kusd taskgreen 0
    kusd taskinteractive 0
    kusd tasklivetranscripts 0
    kusd ttsbackend 0
    kusd ttsserver 0
    kusd web 0
    kusd webcastsocket 0
    kusd webrtcsocket 0
    kusd wordembedding 0
}

function kuwake {
    kusd botweb 1
    kusd celerybeat 1
    kusd cloudsqlproxy 1
    kusd dialogmanager 1
    kusd wordembedding 1
    kusd eventlistener 1
    kusd interactionmanager 1
    kusd taskbotdefault 1
    kusd taskdefault 1
    kusd taskfastlane 1
    kusd taskgreen 1
    kusd taskinteractive 1
    kusd tasklivetranscripts 1
    kusd ttsbackend 1
    kusd ttsserver 1
    kusd web 1
    kusd webcastsocket 1
    kusd webrtcsocket 1
    kusd wordembedding 1
}
