(function wordcloud() {

    var abstract = $('#abstract').text();
    var words = abstract.split(' ');
    var wordlist = [];
    // removing sentence punctuations and exclamations etc.
    for (var i = 0; i < words.length; i++) {
        if (words[i].length !== 0) {
            var words_cleaned = words[i].replace('.', ' ').replace(',', ' ').replace(';', ' ').replace('"', ' ').replace(':', ' ').replace('-', ' ').replace('!', ' ').replace('?', ' ').replace('(', ' ').replace(')', ' ').replace('/\n/', ' ').replace(/\s+/, '');
            wordlist += words_cleaned + ',';
        }

    }

    // removing stopwords from wordlist
    var regex = new RegExp('\\d+');
    var stopwords = ["a","ab","aber","ach","acht","achte","achten","achter","achtes","ag","alle","allein","allem","allen","aller","allerdings","alles","allgemeinen","als","also","am","an","andere","anderen","andern","anders","au","auch","auf","aus","ausser","außer","ausserdem","außerdem","b","bald","bei","beide","beiden","beim","beispiel","bekannt","bereits","besonders","besser","besten","bin","bis","bisher","bist","c","d","da","dabei","dadurch","dafür","dagegen","daher","dahin","dahinter","damals","damit","danach","daneben","dank","dann","daran","darauf","daraus","darf","darfst","darin","darüber","darum","darunter","das","dasein","daselbst","dass","daß","dasselbe","davon","davor","dazu","dazwischen","dein","deine","deinem","deiner","dem","dementsprechend","demgegenüber","demgemäss","demgemäß","demselben","demzufolge","den","denen","denn","denselben","Der","der","deren","derjenige","derjenigen","dermassen","dermaßen","derselbe","derselben","des","deshalb","desselben","dessen","deswegen","d.h","dich","die","diejenige","diejenigen","dies","diese","dieselbe","dieselben","diesem","diesen","dieser","dieses","dir","doch","dort","drei","drin","dritte","dritten","dritter","drittes","du","durch","durchaus","dürfen","dürft","durfte","durften","e","eben","ebenso","ehrlich","ei","ei,","eigen","eigene","eigenen","eigener","eigenes","ein","einander","eine","einem","einen","einer","eines","einige","einigen","einiger","einiges","einmal","eins","elf","en","ende","endlich","entweder","er","Ernst","erst","erste","ersten","erster","erstes","es","etwa","etwas","euch","f","früher","fünf","fünfte","fünften","fünfter","fünftes","für","g","gab","ganz","ganze","ganzen","ganzer","ganzes","gar","gedurft","gegen","gegenüber","gehabt","gehen","geht","gekannt","gekonnt","gemacht","gemocht","gemusst","genug","gerade","gern","gesagt","geschweige","gewesen","gewollt","geworden","gibt","ging","gleich","gott","gross","groß","grosse","große","grossen","großen","grosser","großer","grosses","großes","gut","gute","guter","gutes","h","habe","haben","habt","hast","hat","hatte","hätte","hatten","hätten","heisst","her","heute","hier","hin","hinter","hoch","i","ich","ihm","ihn","ihnen","ihr","ihre","ihrem","ihren","ihrer","ihres","Im","im","immer","In","in","indem","infolgedessen","ins","irgend","ist","j","ja","jahr","jahre","jahren","je","jede","jedem","jeden","jeder","jedermann","jedermanns","jedoch","jemand","jemandem","jemanden","jene","jenem","jenen","jener","jenes","jetzt","k","kam","kann","kannst","kaum","kein","keine","keinem","keinen","keiner","kleine","kleinen","kleiner","kleines","kommen","kommt","können","könnt","konnte","könnte","konnten","kurz","l","lang","lange","leicht","leide","lieber","los","m","machen","macht","machte","mag","magst","mahn","man","manche","manchem","manchen","mancher","manches","mann","mehr","mein","meine","meinem","meinen","meiner","meines","mensch","menschen","mich","mir","mit","mittel","mochte","möchte","mochten","mögen","möglich","mögt","morgen","muss","muß","müssen","musst","müsst","musste","mussten","n","na","nach","nachdem","nahm","natürlich","neben","nein","neue","neuen","neun","neunte","neunten","neunter","neuntes","nicht","nichts","nie","niemand","niemandem","niemanden","noch","nun","nur","o","ob","oben","oder","offen","oft","ohne","Ordnung","p","q","r","recht","rechte","rechten","rechter","rechtes","richtig","rund","s","sa","sache","sagt","sagte","sah","satt","schlecht","Schluss","schon","sechs","sechste","sechsten","sechster","sechstes","sehr","sei","seid","seien","sein","seine","seinem","seinen","seiner","seines","seit","seitdem","selbst","sich","sie","sieben","siebente","siebenten","siebenter","siebentes","sind","so","solang","solche","solchem","solchen","solcher","solches","soll","sollen","sollte","sollten","sondern","sonst","sowie","später","statt","t","tag","tage","tagen","tat","teil","tel","tritt","trotzdem","tun","u","über","überhaupt","übrigens","uhr","um","und","und?","uns","unser","unsere","unserer","unter","v","vergangenen","viel","viele","vielem","vielen","vielleicht","vier","vierte","vierten","vierter","viertes","vom","von","vor","w","wahr?","während","währenddem","währenddessen","wann","war","wäre","waren","wart","warum","was","wegen","weil","weit","weiter","weitere","weiteren","weiteres","welche","welchem","welchen","welcher","welches","wem","wen","wenig","wenige","weniger","weniges","wenigstens","wenn","wer","werde","werden","werdet","wessen","wie","wieder","will","willst","wir","wird","wirklich","wirst","wo","wohl","wollen","wollt","wollte","wollten","worden","wurde","würde","wurden","würden","x","y","z","z.b","zehn","zehnte","zehnten","zehnter","zehntes","zeit","zu","zuerst","zugleich","zum","zunächst","zur","zurück","zusammen","zwanzig","zwar","zwei","zweite","zweiten","zweiter","zweites","zwischen","zwölf","euer","eure","hattest","hattet","jedes","mußt","müßt","sollst","sollt","soweit","weshalb","wieso","woher","wohin"];
    var wordlist = wordlist.split(',');
    var wordlist = wordlist.filter(
        function(e) {
          return this.indexOf(e) < 0;
        },
        stopwords
    );

    //creating one array with word and wordcount
    var wordlist_cleaned = [];
    var result = wordcount(wordlist);
    var keys = result[0];
    var values = result[1];
    for (var key = 0; key < keys.length; key++) {   
        if (keys[key] !== keys[0]) {
            var word = [ keys[key], parseInt(values[key]) ];
            wordlist_cleaned.push( word );
        }     
    }
    
    //creating wordcloud and adapting size to wrapper element
    var div = document.getElementById("card-body-canvas");
    var canvas = document.getElementById("wordcloud-canvas");
    canvas.height = div.offsetHeight - 50;
    canvas.width  = div.offsetWidth - 100;

    // adjusting wordcloud weight size to number of words
    if (wordlist.length < 10) {
        var wFactor = 30;
        var gSize = 24;
    } 
    else if (wordlist.length < 20) {
        var wFactor = 26;
        var gSize = 20;
    } else {
        var wFactor = 14;
        var gSize = 12;
    }

    wordcloud_options = {
        list: wordlist_cleaned,
        gridSize: gSize,
        weightFactor: wFactor,
        drawOutOfBound: false,
        shape: "diamond",
        color: 'random-dark',
        click: mouseClick
    }

    WordCloud( canvas, wordcloud_options );

    // functions
    function mouseClick(item) {   
        var id = item[0] + '_' + item[1] + '_popover';     
        var button_id = item[0] + '_' + item[1] + '_button-popover';
        if ($('#' + id).length == 0) {
            var div = `<div class="col-md-4 popover_wrapper" id="${id}">
                            <div class="card">
                                <div class="card-body">
                                    <div class="words_popup">
                                        <button id="${button_id}" class="ml-2 mb-1 close" type="button" aria-label="Close">x</button>
                                        <h5>${item[0]}</h5>
                                        <p>Anzahl: ${item[1]}</p>
                                    </div>
                                </div>
                            </div>
                        </div>`;
            $('#wrapper-wordcloud').append(div);
            if ($('#wordcloud_rm_all').length == 0) {
                var rm_all = `
                            <div class="col-md-12" id="wordcloud_rm_all_wrapper">
                                <div class="card">
                                    <div class="card-header">
                                        <button id="wordcloud_rm_all" class="ml-2 mb-1 close body_translations" type="button" aria-label="Close" title="alles entfernen">alles entfernen</button>
                                    </div>
                                </div>
                            </div>`;
                $('#wrapper-wordcloud').prepend(rm_all);
            }
            $('#' + button_id).on('click', function() {
                $('#' + id).remove();
            })

            $('#wordcloud_rm_all').on('click', function() {
                $('.popover_wrapper').remove();
                $('#wordcloud_rm_all_wrapper').remove();
            })
        } else {
            $('#' + id).addClass('blink_me');
            setTimeout(function() {
                $('#' + id).removeClass('blink_me');
            }, 3000)
        }          
    }  

    function wordcount(arr) {
        var a = [],
            b = [],
            prev;
        arr.sort();
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] !== prev) {
                a.push(arr[i]);
                b.push(1);
            } else {
                b[b.length - 1]++;
            }
                prev = arr[i];
            }
        return [a, b];
    }
})();