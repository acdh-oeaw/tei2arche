// Create a function to change 
    // the hash value of the page 
    function changeLanguage(lang) { 
        location.hash = lang; 
        location.reload(); 
      } 
  
// Language definitions for navbar
var navbar = {
    en: {
        home: "Home",
        about: "About the Project",
        data: "DATA-Representation",
        color: "Change Color",
        language: "Language",
        institutions: "Institutions",
        persons: "Persons",
        places: "Places",
        register: "Register",
        total_stock: "Total Stocks",
        arche: "ARCHE Editions",
        stock: "Stocks"

    },
    de: {
        home: "Dokument",
        about: "Über das Projekt",
        data: "DATEN-Repräsentation",
        color: "Farben ändern",
        language: "Sprachen",
        institutions: "Institutionen",
        persons: "Personen",
        places: "Orte",
        register: "Register",
        total_stock: "Gesamter Bestand",
        arche: "ARCHE Editionen",
        stock: "Bestände"
    }
}

var body_translations_thun = {
    en: {
        loading: "Can take several minutes",
        download: "Do not close this page to avoid another data download.",
        document_title: "Document Title",
        transformation: "TEI/XML to HTML",
        regest: "Regest",
        remarks: "Remarks about the Document",
        keywords: "Keywords",
        editing: "Text Editing",
        citation: "Citation Info",
        citation_text: "; published by Brigitte Mazohl, Christof Aichner and Tanja Kraler, In: The Correspondence of Leo von Thun-Hohenstein, https://thun-korrespondenz.acdh.oeaw.ac.at",
        signature: "Signature",
        extent: "Extent",
        license: "License",
        close: "Close",
        total_stock: "Total Stocks",
        organisatio_name: "Organisation Name",
        placename: "Placename (normalized)",
        alternative: "Alternative Name",
        mentioned: "Mentioned",
        first_name: "First Name",
        last_name: "Last Name",
        life_data: "About his Life",
        biography: "Short Biography"
    },
    de: {
        loading: "Kann mehrere Minuten in Anspruch nehmen",
        download: "Diese Seite nicht schließen um einen erneuten Datendownload zu vermeiden.",
        document_title: "Dokumenttitle",
        transformation: "TEI/XML zu HTML",
        regest: "Regest",
        remarks: "Anmerkungen zum Dokument",
        keywords: "Schlagworte",
        editing: "Editierter Text",
        citation: "Zitierhinweis",
        citation_text: "; hrsg von Brigitte Mazohl, Christof Aichner und Tanja Kraler, In: Die Korrespondenz von Leo von Thun-Hohenstein, https://thun-korrespondenz.acdh.oeaw.ac.at",
        signature: "Signatur",
        extent: "Extent",
        license: "Lizenz",
        close: "Schließen",
        total_stock: "Gesamter Betand",
        organisatio_name: "Organisationsname",
        placename: "Ortsname (normalisiert)",
        alternative: "Alternative Schreibweisen",
        mentioned: "Erwähnungen",
        first_name: "Vorname",
        last_name: "Name",
        life_data: "Lebensdaten",
        biography: "Kurzbiographie"
    }
}

var body_translations_daacda = {
    en: {
        connection: "Sort of Connection",
        from: "from",
        to: "to",
        place: "Place",
        airplane_title: "Airplane",
        macr: "MACR-No.",
        airplane_type: "Airplane Type",
        airplane_no: "Airplane No.",
        airplane_name: "Airplane Name",
        squadron: "Squadron",
        date_of_crash: "Date of Crash",
        reason_of_crash: "Reason of Crash",
        target_place: "Destination",
        crash_place: "Place of Crash",
        coordinates_last_sight: "Coordinates of last sighting",
        sighting_place: "Sighting-Place",
        sighting_country: "Sighting-Country",
        sighting_time: "Sighting-Time",
        time_of_crash: "Time of Crash",
        comment: "Comment",
        id: "Internal ID",
        identification_no: "Identification No.",
        last_name: "Last Name",
        first_name: "First Name", 
        middle_name: "Middle Name", 
        airplane_function: "Function in the Airplane", 
        rank: "Rank", 
        entry_macr: "Entry MACR", 
        destiny: "Destiny",
        destiny_exact: "Destiny exact",
        stations: "Stations of Imprisonment"
    },
    de: {
        connection: "Art der Verbindung",
        from: "von",
        to: "bis",
        place: "Ort",
        airplane_title: "Flugzeug",
        macr: "MACR-Nr",
        airplane_type: "Flugzeugtyp",
        airplane_no: "Flugzeugnr",
        airplane_name: "Flugzeugname",
        squadron: "Staffel",
        date_of_crash: "Datum Absturz",
        reason_of_crash: "Absturzursache",
        target_place: "Zielort",
        crash_place: "Absturzort",
        coordinates_last_sight: "Koordinaten der letzten Sichtung",
        sighting_place: "Sichtung-Ort",
        sighting_country: "Sichtung-Land",
        sighting_time: "Sichtung-Uhrzeit",
        time_of_crash: "Uhrzeit Absturz",
        comment: "Kommentar",
        id: "Interne ID",
        identification_no: "Kennnummer",
        last_name: "Nachname",
        first_name: "Vorname", 
        middle_name: "Mittelname", 
        airplane_function: "Funktion im Flugzeug", 
        rank: "Dienstgrad", 
        entry_macr: "Eintrag MACR", 
        destiny: "Schicksal",
        destiny_exact: "Schicksal genau",
        stations: "Stationen der Gefangenschaft"
    }
}

var modal_translations = {
    en: {
        concepts: "Concept(s)",
        places: "Place(s)",
        org: "Organisation(s)",
        close: "Close"
    },
    de: {
        concepts: "Konzept(e)",
        places: "Ort(e)",
        org: "Organisation(en)",
        close: "Schließen"
    }
}

// Check if a hash value exists in the URL 
if (window.location.hash){
    //Set navbar language
    if(window.location.hash == "#en"){
        var nav_links = document.getElementsByClassName('nav-link');        
        for (i = 0; i < nav_links.length; i++){
            if (nav_links[i].getAttribute('title') == "Home"){
                nav_links[i].textContent = navbar.en.home;
            }
            else if (nav_links[i].getAttribute('title') == "About the Project") {
                nav_links[i].textContent = navbar.en.about;
            }
            else if (nav_links[i].getAttribute('title') == "DATA-Representation") {
                nav_links[i].textContent = navbar.en.data;
            }
            else if (nav_links[i].getAttribute('title') == "Stock") {
                nav_links[i].textContent = navbar.en.stock;
            }
            else if (nav_links[i].getAttribute('title') == "Arche Editions") {
                nav_links[i].textContent = navbar.en.arche;
            }
            else if (nav_links[i].getAttribute('title') == "Total Stock") {
                nav_links[i].textContent = navbar.en.total_stock;
            }
            else if (nav_links[i].getAttribute('title') == "Register") {
                nav_links[i].textContent = navbar.en.register;
            }
            else if (nav_links[i].getAttribute('title') == "Places") {
                nav_links[i].textContent = navbar.en.places;
            }
            else if (nav_links[i].getAttribute('title') == "Persons") {
                nav_links[i].textContent = navbar.en.persons;
            }
            else if (nav_links[i].getAttribute('title') == "Institute") {
                nav_links[i].textContent = navbar.en.institutions;
            }
            else if (nav_links[i].getAttribute('title') == "Language") {
                nav_links[i].textContent = navbar.en.language;
            }
            else if (nav_links[i].getAttribute('title') == "Colors") {
                nav_links[i].textContent = navbar.en.color;
            }
            
        }
        var body = document.getElementsByClassName('body_translations');
        for (i = 0; i < body.length; i++){
            if (body[i].getAttribute('data-translation') == "Loading"){
                body[i].textContent = body_translations_thun.en.loading;
                body[i].setAttribute('title', body_translations_thun.en.loading);
            }
            else if (body[i].getAttribute('data-translation') == "Download Info") {
                body[i].textContent = body_translations_thun.en.download;
                body[i].setAttribute('title', body_translations_thun.en.download);
            }
            else if (body[i].getAttribute('data-translation') == "Total Stocks") {
                body[i].textContent = body_translations_thun.en.total_stock;
                body[i].setAttribute('title', body_translations_thun.en.total_stock);
            }
            else if (body[i].getAttribute('data-translation') == "Document Title") {
                body[i].textContent = body_translations_thun.en.document_title;
                body[i].setAttribute('title', body_translations_thun.en.document_title);
            }
            else if (body[i].getAttribute('data-translation') == "HTML Transformation") {
                body[i].textContent = body_translations_thun.en.transformation;
                body[i].setAttribute('title', body_translations_thun.en.transformation);
            }
            else if (body[i].getAttribute('data-translation') == "Regest") {
                body[i].textContent = body_translations_thun.en.regest;
                body[i].setAttribute('title', body_translations_thun.en.regest);
            }
            else if (body[i].getAttribute('data-translation') == "Remarks about the Document") {
                body[i].textContent = body_translations_thun.en.remarks;
                body[i].setAttribute('title', body_translations_thun.en.remarks);
            }
            else if (body[i].getAttribute('data-translation') == "Keywords") {
                body[i].textContent = body_translations_thun.en.keywords;
                body[i].setAttribute('title', body_translations_thun.en.keywords);
            }
            else if (body[i].getAttribute('data-translation') == "Text Editing") {
                body[i].textContent = body_translations_thun.en.editing;
                body[i].setAttribute('title', body_translations_thun.en.editing);
            }
            else if (body[i].getAttribute('data-translation') == "Citation") {
                body[i].textContent = body_translations_thun.en.citation;
                body[i].setAttribute('title', body_translations_thun.en.citation);
            }
            else if (body[i].getAttribute('data-translation') == "citation_text") {
                body[i].textContent = body_translations_thun.en.citation_text;
                body[i].setAttribute('title', body_translations_thun.en.citation_text);
            }
            else if (body[i].getAttribute('data-translation') == "Signature") {
                body[i].textContent = body_translations_thun.en.signature;
                body[i].setAttribute('title', body_translations_thun.en.signature);
            }
            else if (body[i].getAttribute('data-translation') == "Extent") {
                body[i].textContent = body_translations_thun.en.extent;
                body[i].setAttribute('title', body_translations_thun.en.extent);
            }
            else if (body[i].getAttribute('data-translation') == "License") {
                body[i].textContent = body_translations_thun.en.license;
                body[i].setAttribute('title', body_translations_thun.en.license);
            }
            else if (body[i].getAttribute('data-translation') == "Close") {
                body[i].textContent = body_translations_thun.en.close;
                body[i].setAttribute('title', body_translations_thun.en.close);
            }
            else if (body[i].getAttribute('data-translation') == "Organisation Name") {
                body[i].textContent = body_translations_thun.en.organisatio_name;
                body[i].setAttribute('title', body_translations_thun.en.organisatio_name);
            }
            else if (body[i].getAttribute('data-translation') == "Placename") {
                body[i].textContent = body_translations_thun.en.placename;
                body[i].setAttribute('title', body_translations_thun.en.placename);
            }
            else if (body[i].getAttribute('data-translation') == "Alternative") {
                body[i].textContent = body_translations_thun.en.alternative;
                body[i].setAttribute('title', body_translations_thun.en.alternative);
            }
            else if (body[i].getAttribute('data-translation') == "Mentioned") {
                body[i].textContent = body_translations_thun.en.mentioned;
                body[i].setAttribute('title', body_translations_thun.en.mentioned);
            }
            else if (body[i].getAttribute('data-translation') == "Last Name") {
                body[i].textContent = body_translations_thun.en.last_name;
                body[i].setAttribute('title', body_translations_thun.en.last_name);
            }
            else if (body[i].getAttribute('data-translation') == "First Name") {
                body[i].textContent = body_translations_thun.en.first_name;
                body[i].setAttribute('title', body_translations_thun.en.first_name);
            }
            else if (body[i].getAttribute('data-translation') == "Life Data") {
                body[i].textContent = body_translations_thun.en.life_data;
                body[i].setAttribute('title', body_translations_thun.en.life_data);
            }
            else if (body[i].getAttribute('data-translation') == "Biography") {
                body[i].textContent = body_translations_thun.en.biography;
                body[i].setAttribute('title', body_translations_thun.en.biography);
            }
            else if (body[i].getAttribute('data-translation') == "Sort of Connection") {
                body[i].textContent = body_translations_daacda.en.connection;
            }
            else if (body[i].getAttribute('data-translation') == "from") {
                body[i].textContent = body_translations_daacda.en.from;
            }
            else if (body[i].getAttribute('data-translation') == "to") {
                body[i].textContent = body_translations_daacda.en.to;
            }
            else if (body[i].getAttribute('data-translation') == "Place") {
                body[i].textContent = body_translations_daacda.en.place;
            }
            else if (body[i].textContent == body_translations_daacda.de.macr) {
                body[i].textContent = body_translations_daacda.en.macr;
            }
            else if (body[i].textContent == body_translations_daacda.de.airplane_type) {
                body[i].textContent = body_translations_daacda.en.airplane_type;
            }
            else if (body[i].textContent == body_translations_daacda.de.airplane_no) {
                body[i].textContent = body_translations_daacda.en.airplane_no;
            }
            else if (body[i].textContent == body_translations_daacda.de.airplane_name) {
                body[i].textContent = body_translations_daacda.en.airplane_name;
            }
            else if (body[i].textContent == body_translations_daacda.de.airplane_title) {
                body[i].textContent = body_translations_daacda.en.airplane_title;
            }
            else if (body[i].textContent == body_translations_daacda.de.squadron) {
                body[i].textContent = body_translations_daacda.en.squadron;
            }
            else if (body[i].textContent == body_translations_daacda.de.date_of_crash) {
                body[i].textContent = body_translations_daacda.en.date_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.de.reason_of_crash) {
                body[i].textContent = body_translations_daacda.en.reason_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.de.target_place) {
                body[i].textContent = body_translations_daacda.en.target_place;
            }
            else if (body[i].textContent == body_translations_daacda.de.crash_place) {
                body[i].textContent = body_translations_daacda.en.crash_place;
            }
            else if (body[i].textContent == body_translations_daacda.de.coordinates_last_sight) {
                body[i].textContent = body_translations_daacda.en.coordinates_last_sight;
            }
            else if (body[i].textContent == body_translations_daacda.de.sighting_place) {
                body[i].textContent = body_translations_daacda.en.sighting_place;
            }
            else if (body[i].textContent == body_translations_daacda.de.sighting_country) {
                body[i].textContent = body_translations_daacda.en.sighting_country;
            }
            else if (body[i].textContent == body_translations_daacda.de.sighting_time) {
                body[i].textContent = body_translations_daacda.en.sighting_time;
            }
            else if (body[i].textContent == body_translations_daacda.de.time_of_crash) {
                body[i].textContent = body_translations_daacda.en.time_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.de.id) {
                body[i].textContent = body_translations_daacda.en.id;
            }
            else if (body[i].textContent == body_translations_daacda.de.identification_no) {
                body[i].textContent = body_translations_daacda.en.identification_no;
            }
            else if (body[i].textContent == body_translations_daacda.de.last_name) {
                body[i].textContent = body_translations_daacda.en.last_name;
            }
            else if (body[i].textContent == body_translations_daacda.de.first_name) {
                body[i].textContent = body_translations_daacda.en.first_name;
            }
            else if (body[i].textContent == body_translations_daacda.de.middle_name) {
                body[i].textContent = body_translations_daacda.en.middle_name;
            }
            else if (body[i].textContent == body_translations_daacda.de.airplane_function) {
                body[i].textContent = body_translations_daacda.en.airplane_function;
            }
            else if (body[i].textContent == body_translations_daacda.de.rank) {
                body[i].textContent = body_translations_daacda.en.rank;
            }
            else if (body[i].textContent == body_translations_daacda.de.entry_macr) {
                body[i].textContent = body_translations_daacda.en.entry_macr;
            }
            else if (body[i].textContent == body_translations_daacda.de.destiny) {
                body[i].textContent = body_translations_daacda.en.destiny;
            }
            else if (body[i].textContent == body_translations_daacda.de.destiny_exact) {
                body[i].textContent = body_translations_daacda.en.destiny_exact;
            }
            else if (body[i].textContent == body_translations_daacda.de.stations) {
                body[i].textContent = body_translations_daacda.en.stations;
            }
            else if (body[i].textContent == body_translations_daacda.de.concepts) {
                body[i].textContent = body_translations_daacda.en.concepts;
            }
            else if (body[i].textContent == body_translations_daacda.de.concepts) {
                body[i].textContent = body_translations_daacda.en.concepts;
            }
        }
        var modal = document.getElementsByClassName('modal_translations');
        for (i = 0; i < modal.length; i++){
            if (modal[i].textContent == modal_translations.de.concepts) {
                modal[i].textContent = modal_translations.en.concepts;
            }
            else if (modal[i].textContent == modal_translations.de.org) {
                modal[i].textContent = modal_translations.en.org;
            }
            else if (modal[i].textContent == modal_translations.de.places) {
                modal[i].textContent = modal_translations.en.places;
            }
            else if (modal[i].textContent == modal_translations.de.close) {
                modal[i].textContent = modal_translations.en.close;
            }
        }
    }
    else if (window.location.hash == "#de"){
        var nav_links = document.getElementsByClassName('nav-link');
        for (i = 0; i < nav_links.length; i++){
            if (nav_links[i].getAttribute('title') == "Home"){
                nav_links[i].textContent = navbar.de.home;
            }
            else if (nav_links[i].getAttribute('title') == "About the Project") {
                nav_links[i].textContent = navbar.de.about;
            }
            else if (nav_links[i].getAttribute('title') == "DATA-Representation") {
                nav_links[i].textContent = navbar.de.data;
            }
            else if (nav_links[i].getAttribute('title') == "Stock") {
                nav_links[i].textContent = navbar.de.stock;
            }
            else if (nav_links[i].getAttribute('title') == "Arche Editions") {
                nav_links[i].textContent = navbar.de.arche;
            }
            else if (nav_links[i].getAttribute('title') == "Total Stock") {
                nav_links[i].textContent = navbar.de.total_stock;
            }
            else if (nav_links[i].getAttribute('title') == "Register") {
                nav_links[i].textContent = navbar.de.register;
            }
            else if (nav_links[i].getAttribute('title') == "Places") {
                nav_links[i].textContent = navbar.de.places;
            }
            else if (nav_links[i].getAttribute('title') == "Persons") {
                nav_links[i].textContent = navbar.de.persons;
            }
            else if (nav_links[i].getAttribute('title') == "Institute") {
                nav_links[i].textContent = navbar.de.institutions;
            }
            else if (nav_links[i].getAttribute('title') == "Language") {
                nav_links[i].textContent = navbar.de.language;
            }
            else if (nav_links[i].getAttribute('title') == "Colors") {
                nav_links[i].textContent = navbar.de.color;
            }
        }
        var body = document.getElementsByClassName('body_translations');
        for (i = 0; i < body.length; i++){
            if (body[i].getAttribute('data-translation') == "Loading"){
                body[i].textContent = body_translations_thun.de.loading;
                body[i].setAttribute('title', body_translations_thun.de.loading);
            }
            else if (body[i].getAttribute('data-translation') == "Download Info") {
                body[i].textContent = body_translations_thun.de.download;
                body[i].setAttribute('title', body_translations_thun.de.download);
            }
            else if (body[i].getAttribute('data-translation') == "Total Stocks") {
                body[i].textContent = body_translations_thun.de.total_stock;
                body[i].setAttribute('title', body_translations_thun.de.total_stock);
            }
            else if (body[i].getAttribute('data-translation') == "Document Title") {
                body[i].textContent = body_translations_thun.de.document_title;
                body[i].setAttribute('title', body_translations_thun.de.document_title);
            }
            else if (body[i].getAttribute('data-translation') == "HTML Transformation") {
                body[i].textContent = body_translations_thun.de.transformation;
                body[i].setAttribute('title', body_translations_thun.de.transformation);
            }
            else if (body[i].getAttribute('data-translation') == "Regest") {
                body[i].textContent = body_translations_thun.de.regest;
                body[i].setAttribute('title', body_translations_thun.de.regest);
            }
            else if (body[i].getAttribute('data-translation') == "Remarks about the Document") {
                body[i].textContent = body_translations_thun.de.remarks;
                body[i].setAttribute('title', body_translations_thun.de.remarks);
            }
            else if (body[i].getAttribute('data-translation') == "Keywords") {
                body[i].textContent = body_translations_thun.de.keywords;
                body[i].setAttribute('title', body_translations_thun.de.keywords);
            }
            else if (body[i].getAttribute('data-translation') == "Text Editing") {
                body[i].textContent = body_translations_thun.de.editing;
                body[i].setAttribute('title', body_translations_thun.de.editing);
            }
            else if (body[i].getAttribute('data-translation') == "Citation") {
                body[i].textContent = body_translations_thun.de.citation;
                body[i].setAttribute('title', body_translations_thun.de.citation);
            }
            else if (body[i].getAttribute('data-translation') == "citation_text") {
                body[i].textContent = body_translations_thun.de.citation_text;
                body[i].setAttribute('title', body_translations_thun.de.citation_text);
            }
            else if (body[i].getAttribute('data-translation') == "Signature") {
                body[i].textContent = body_translations_thun.de.signature;
                body[i].setAttribute('title', body_translations_thun.de.signature);
            }
            else if (body[i].getAttribute('data-translation') == "Extent") {
                body[i].textContent = body_translations_thun.de.extent;
                body[i].setAttribute('title', body_translations_thun.de.extent);
            }
            else if (body[i].getAttribute('data-translation') == "License") {
                body[i].textContent = body_translations_thun.de.license;
                body[i].setAttribute('title', body_translations_thun.de.license);
            }
            else if (body[i].getAttribute('data-translation') == "Close") {
                body[i].textContent = body_translations_thun.de.close;
                body[i].setAttribute('title', body_translations_thun.de.close);
            }
            else if (body[i].getAttribute('data-translation') == "Organisation Name") {
                body[i].textContent = body_translations_thun.de.organisatio_name;
                body[i].setAttribute('title', body_translations_thun.de.organisatio_name);
            }
            else if (body[i].getAttribute('data-translation') == "Placename") {
                body[i].textContent = body_translations_thun.de.placename;
                body[i].setAttribute('title', body_translations_thun.de.placename);
            }
            else if (body[i].getAttribute('data-translation') == "Alternative") {
                body[i].textContent = body_translations_thun.de.alternative;
                body[i].setAttribute('title', body_translations_thun.de.alternative);
            }
            else if (body[i].getAttribute('data-translation') == "Mentioned") {
                body[i].textContent = body_translations_thun.de.mentioned;
                body[i].setAttribute('title', body_translations_thun.de.mentioned);
            }
            else if (body[i].getAttribute('data-translation') == "Last Name") {
                body[i].textContent = body_translations_thun.de.last_name;
                body[i].setAttribute('title', body_translations_thun.de.last_name);
            }
            else if (body[i].getAttribute('data-translation') == "First Name") {
                body[i].textContent = body_translations_thun.de.first_name;
                body[i].setAttribute('title', body_translations_thun.de.first_name);
            }
            else if (body[i].getAttribute('data-translation') == "Life Data") {
                body[i].textContent = body_translations_thun.de.life_data;
                body[i].setAttribute('title', body_translations_thun.de.life_data);
            }
            else if (body[i].getAttribute('data-translation') == "Biography") {
                body[i].textContent = body_translations_thun.de.biography;
                body[i].setAttribute('title', body_translations_thun.de.biography);
            }
            else if (body[i].getAttribute('data-translation') == "Sort of Connection") {
                body[i].textContent = body_translations_daacda.de.connection;
            }
            else if (body[i].getAttribute('data-translation') == "from") {
                body[i].textContent = body_translations_daacda.de.from;
            }
            else if (body[i].getAttribute('data-translation') == "to") {
                body[i].textContent = body_translations_daacda.de.to;
            }
            else if (body[i].getAttribute('data-translation') == "Place") {
                body[i].textContent = body_translations_daacda.de.place;
            }
            else if (body[i].textContent == body_translations_daacda.en.macr) {
                body[i].textContent = body_translations_daacda.de.macr;
            }
            else if (body[i].textContent == body_translations_daacda.en.airplane_type) {
                body[i].textContent = body_translations_daacda.de.airplane_type;
            }
            else if (body[i].textContent == body_translations_daacda.en.airplane_no) {
                body[i].textContent = body_translations_daacda.de.airplane_no;
            }
            else if (body[i].textContent == body_translations_daacda.en.airplane_name) {
                body[i].textContent = body_translations_daacda.de.airplane_name;
            }
            else if (body[i].textContent == body_translations_daacda.en.airplane_title) {
                body[i].textContent = body_translations_daacda.de.airplane_title;
            }
            else if (body[i].textContent == body_translations_daacda.en.squadron) {
                body[i].textContent = body_translations_daacda.de.squadron;
            }
            else if (body[i].textContent == body_translations_daacda.en.date_of_crash) {
                body[i].textContent = body_translations_daacda.de.date_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.en.reason_of_crash) {
                body[i].textContent = body_translations_daacda.de.reason_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.en.target_place) {
                body[i].textContent = body_translations_daacda.de.target_place;
            }
            else if (body[i].textContent == body_translations_daacda.en.crash_place) {
                body[i].textContent = body_translations_daacda.de.crash_place;
            }
            else if (body[i].textContent == body_translations_daacda.en.coordinates_last_sight) {
                body[i].textContent = body_translations_daacda.de.coordinates_last_sight;
            }
            else if (body[i].textContent == body_translations_daacda.en.sighting_place) {
                body[i].textContent = body_translations_daacda.de.sighting_place;
            }
            else if (body[i].textContent == body_translations_daacda.en.sighting_country) {
                body[i].textContent = body_translations_daacda.de.sighting_country;
            }
            else if (body[i].textContent == body_translations_daacda.en.sighting_time) {
                body[i].textContent = body_translations_daacda.de.sighting_time;
            }
            else if (body[i].textContent == body_translations_daacda.en.time_of_crash) {
                body[i].textContent = body_translations_daacda.de.time_of_crash;
            }
            else if (body[i].textContent == body_translations_daacda.en.id) {
                body[i].textContent = body_translations_daacda.de.id;
            }
            else if (body[i].textContent == body_translations_daacda.en.identification_no) {
                body[i].textContent = body_translations_daacda.de.identification_no;
            }
            else if (body[i].textContent == body_translations_daacda.en.last_name) {
                body[i].textContent = body_translations_daacda.de.last_name;
            }
            else if (body[i].textContent == body_translations_daacda.en.first_name) {
                body[i].textContent = body_translations_daacda.de.first_name;
            }
            else if (body[i].textContent == body_translations_daacda.en.middle_name) {
                body[i].textContent = body_translations_daacda.de.middle_name;
            }
            else if (body[i].textContent == body_translations_daacda.en.airplane_function) {
                body[i].textContent = body_translations_daacda.de.airplane_function;
            }
            else if (body[i].textContent == body_translations_daacda.en.rank) {
                body[i].textContent = body_translations_daacda.de.rank;
            }
            else if (body[i].textContent == body_translations_daacda.en.entry_macr) {
                body[i].textContent = body_translations_daacda.de.entry_macr;
            }
            else if (body[i].textContent == body_translations_daacda.en.destiny) {
                body[i].textContent = body_translations_daacda.de.destiny;
            }
            else if (body[i].textContent == body_translations_daacda.en.destiny_exact) {
                body[i].textContent = body_translations_daacda.de.destiny_exact;
            }
            else if (body[i].textContent == body_translations_daacda.en.stations) {
                body[i].textContent = body_translations_daacda.de.stations;
            }
        }
        var modal = document.getElementsByClassName('modal_translations');
        for (i = 0; i < modal.length; i++){
            if (modal[i].textContent == modal_translations.en.concepts) {
                modal[i].textContent = modal_translations.de.concepts;
            }
            else if (modal[i].textContent == modal_translations.en.org) {
                modal[i].textContent = modal_translations.de.org;
            }
            else if (modal[i].textContent == modal_translations.en.places) {
                modal[i].textContent = modal_translations.de.places;
            }
            else if (modal[i].textContent == modal_translations.en.close) {
                modal[i].textContent = modal_translations.de.close;
            }
        }
    }
}