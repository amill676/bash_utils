alias forge='python -m forge'


function zensh {
    cd ~/vm/dossier/zenapi;
    workon zenapi;
    python manage.py shell
}


function kusleep {
    kusd botweb 0
    kusd celerybeat 0
    kusd cloudsqlproxy 0
    kusd conversationindexproxy 0
    kusd dialogmanager 0
    kusd docsearch-db 0
    kusd eventlistener 0
    kusd interactionmanager 0
    kusd junkswitch 0
    kusd redis 0
    kusd savedsearchesindexproxy 0
    kusd sipgateway 0
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
    kusd nodeautoscaler 0

    ku scale sts rediscluster-master --replicas 0
    ku scale sts rediscluster-slave --replicas 0

    # Get rid of pod disruption budgets to avoid node scaling hanging
    ku delete pdb --all

    gcsp gridspace-dev
    # Do gpu pool first since its most expensive
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool gpu-pool --num-nodes 0
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool static-pool --num-nodes 0
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool dynamic-pool-16 --num-nodes 0
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool small-webcast-pool --num-nodes 0
    # Don't scale this down since we need the consistent external IP
    #gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool new-sip-gateway-pool --num-nodes 0
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool switch-pool --num-nodes 0
}

function kuwakepods {
    kusd junkswitch 1  # put this first so hopefully nothing steals the switch node
    kusd botweb 1
    kusd celerybeat 1
    kusd cloudsqlproxy 1
    kusd conversationindexproxy 1
    kusd dialogmanager 1
    kusd docsearch-db 1
    kusd eventlistener 1
    kusd interactionmanager 1
    kusd redis 1
    kusd savedsearchesindexproxy 1
    kusd sipgateway 1
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
    kusd nodeautoscaler 1

    ku scale sts rediscluster-master --replicas 3
    ku scale sts rediscluster-slave --replicas 3
}

function kuwake {
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool static-pool --num-nodes 12
    #gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool new-sip-gateway-pool --num-nodes 1
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool switch-pool --num-nodes 1
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool dynamic-pool-16 --num-nodes 2
    gcloud --quiet container clusters resize adam-dev --zone us-west1-a --node-pool gpu-pool --num-nodes 1

    kuwakepods
}

alias killjunk='ps aux | grep "python -m junkswitch run" | grep -v "grep" | col2 | xargs kill -9'
