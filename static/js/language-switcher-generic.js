// Create a function to change 
    // the hash value of the page 
    function changeLanguage(lang) { 
        location.hash = lang; 
        location.reload(); 
    }    

// Language definitions ALL
// obj key en and de must have same lengths and same key names
var translation_obj = {
    en: {
        // navbar
        home: "Home",
        about: "About the Project",
        data: "DATA-Representation",
        color: "Change Color",
        language: "Languages",
        institutions: "Institutions",
        persons: "Persons",
        places: "Places",
        register: "Register",
        total_stock: "Entire Inventory",
        arche: "ARCHE Editions",
        stock: "Inventory",
        //thun body
        loading: "Can take several minutes",
        document_title: "Document Title",
        transformation: "TEI/XML to HTML",
        regest: "Regest",
        remarks: "Remarks about the Document",
        keywords: "Keywords",
        editing: "Edited Text",
        citation: "Citation Info",
        citation_text: "; published by Brigitte Mazohl, Christof Aichner and Tanja Kraler, In: The Correspondence of Leo von Thun-Hohenstein, ",
        citation_text_2: ", accessed on ",
        signature: "Signature",
        extent: "Extent",
        license: "License",
        organisatio_name: "Organisation Name",
        placename: "Placename (normalized)",
        alternative: "Alternative Name",
        mentioned: "Mentioned",
        first_name: "First Name",
        last_name: "Last Name",
        life_data: "About his Life",
        biography: "Short Biography",
        open: "Open",
        title_listplace: "Table of Places",
        title_listperson: "Table of Persons",
        title_listorg: "Table of Institutions",
        // thun specific modal_metadata from teiHeader
        thun_resp1: "providing the content",
        thun_resp2: "converted to XML encoding",
        thun_resp3: "georeferenced",
        thun_note1: "Biography",
        // daacda body
        connection: "Sort of Connection",
        from: "from",
        to: "to",
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
        middle_name: "Middle Name", 
        airplane_function: "Function in the Airplane", 
        rank: "Rank", 
        entry_macr: "Entry MACR", 
        destiny: "Destiny",
        destiny_exact: "Destiny exact",
        stations: "Stations of Imprisonment",
        subCollections: "Sub-Collections",
        search: "Search...",
        collections: "Collections",
        crew_stations: "Crew Stations",
        // daacda specific modal_metadata from teiHeader
        daacda_resp1: "Project-Leader, Data-Collection",
        daacda_resp2: "Data-Collection",
        daacda_resp3: "Data-Curation",
        daacda_resp4: "Data-Modelling, creation of a data application for data-collection and data convertion to TEI",
        // schnitzler-tagebuch
        work: "No additional information found",
        work_title: "Works",
        work_tei_title_alt: "Alternative Title",
        work_tei_title: "Title",
        register_places: "Places",
        register_persons: "Persons",
        register_works_title: "Mentioned Works",
        register_places_title: "Mentioned Places",
        register_persons_title: "Mentioned Persons",
        register_works: "Works",
        // Große Transformation
        institutions_title: "Mentioned Institutions",
        remove_all: "remove all",
        // modal translations
        concepts: "Concept(s)",
        place_s: "Place(s)",  
        place: "Place",
        org: "Organisation(s)",
        tei_header_publicationStmt: "Publication",
        tei_header_sourceDesc: "Source Description",
        tei_header_encodingDesc: "Encoding Description",
        coordinates: "Coordinates",
        mentioned_in: "Mentioned in",
        orgName_type: "Type not available",
        date_of_death: "Date of Death",
        place_of_death: "Place of Death",
        date_of_birth: "Birthdate",
        birth_data: "Birth Data",
        place_of_birth: "Birthplace",
        death_data: "Death Data",
        description: "Description",
        alternative_description: "Alternative Description",
        searchResult: "Search Result",
        abstract: "Abstract",
        rolename: "Role Name",
        date: "Date"
    },
    de: {
        // navbar
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
        stock: "Bestände",
        // thun body
        loading: "Kann mehrere Minuten in Anspruch nehmen",
        document_title: "Dokumenttitel",
        transformation: "TEI/XML zu HTML",
        regest: "Regest",
        remarks: "Anmerkungen zum Dokument",
        keywords: "Schlagworte",
        editing: "Editierter Text",
        citation: "Zitierhinweis",
        citation_text: "; hrsg von Brigitte Mazohl, Christof Aichner und Tanja Kraler, In: Die Korrespondenz von Leo von Thun-Hohenstein, ",
        citation_text_2: ", aufgerufen am ",
        signature: "Signatur",
        extent: "Extent",
        license: "Lizenz",
        organisatio_name: "Organisationsname",
        placename: "Ortsname (normalisiert)",
        alternative: "Alternative Schreibweisen",
        mentioned: "Erwähnungen",
        first_name: "Vorname",
        last_name: "Name",
        life_data: "Lebensdaten",
        biography: "Kurzbiographie",
        open: "Öffnen",
        title_listplace: "Ortsverzeichnis",
        title_listperson: "Personenverzeichnis",
        title_listorg: "Institutionsverzeichnis",
        crew_stations: "Crew Stationen",
        // thun specific modal_metadata from teiHeader
        thun_resp1: "Inhalte zu Verfügung gestellt",
        thun_resp2: "Konvertiert zu XML-Encoding",
        thun_resp3: "Georeferenziert",
        //thun_note1: "Lebensdaten", already added above
        thun_note1: "Biographie",
        // daacda body
        connection: "Art der Verbindung",
        from: "von",
        to: "bis",
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
        stations: "Stationen der Gefangenschaft",
        subCollections: "Unterkollektionen",
        search: "Suchen...",
        collections: "Kollektionen",
        // daacda specific modal_metadata from teiHeader
        daacda_resp1: "Projektleitung, Datenerhebung",
        daacda_resp2: "Datenerhebung",
        daacda_resp3: "Datenkuratierung",
        daacda_resp4: "Datenmodellierung, Aufsetzen einer Datenbankapplikation zur Datenerhebung und Datenkonvertierung nach TEI",
        // schnitzler-tagebuch
        work: "Keine weiteren Informationen gefunden",
        work_title: "Werke",
        work_tei_title_alt: "Alternativer Titel",
        work_tei_title: "Titel",
        register_places: "Orte",
        register_persons: "Personen",
        register_works_title: "Erwähnte Werke",
        register_places_title: "Erwähnte Orte",
        register_persons_title: "Erwähnte Personen",
        register_works: "Werke",
        // Große Transformation
        institutions_title: "Erwähnte Institutionen",
        remove_all: "alles entfernen",
        //modal translations
        concepts: "Konzept(e)",
        place_s: "Ort(e)",    
        place: "Ort",
        org: "Organisation(en)",
        tei_header_publicationStmt: "Publikation",
        tei_header_sourceDesc: "Datenbeschreibung",
        tei_header_encodingDesc: "Datenverarbeitung",
        coordinates: "Koordinaten",
        mentioned_in: "Erwähnt in",
        orgName_type: "Typ nicht verfügbar",
        date_of_death: "Todesdatum",
        place_of_death: "Sterbeort",
        date_of_birth: "Geburtsdatum",
        birth_data: "Geburtsdaten",
        place_of_birth: "Geburtsort",
        death_data: "Sterbedaten",
        description: "Bezeichnung",
        alternative_description: "Alternative Bezeichnung",
        searchResult: "Suchergebnis",
        abstract: "Zusammenfassung",
        rolename: "Rollenname",
        date: "Datum"
    }
}

// Check if a hash value exists in the URL 
if (window.location.hash){
    //Set navbar language
    if(window.location.hash == "#en"){
        // access class with strings to translate
        var translate = document.getElementsByClassName('body_translations');
        // create specific variables for each language
        var find_de = translation_obj.de;   
        var find_en = translation_obj.en;       
        // loop for html strings   
        for (i = 0; i < translate.length; i++){     
            // loop for translations
            for (var key in find_de){
                if (find_de.hasOwnProperty(key)){
                    // find correct match of html strings and translate obj
                    if (translate[i].getAttribute('title') == find_de[key]){
                        // use matched obj key and set german as language
                        translate[i].textContent = find_en[key];
                        translate[i].setAttribute('title',find_en[key]);
                    }
                }
            } 
        }
    }
}

// Check if a hash value exists in the URL 
if (window.location.hash){
    //Set navbar language
    if(window.location.hash == "#de"){
        // access class with strings to translate
        var translate = document.getElementsByClassName('body_translations');
        // create specific variables for each language
        var find_de = translation_obj.de;   
        var find_en = translation_obj.en; 
        // loop for html strings           
        for (i = 0; i < translate.length; i++){    
            // loop for translations 
            for (var key in find_de){
                if (find_de.hasOwnProperty(key)){
                    // find correct match of html strings and translate obj
                    if (translate[i].getAttribute('title') == find_en[key]){
                        // use matched obj key and set german as language
                        translate[i].textContent = find_de[key];
                        translate[i].setAttribute('title',find_de[key]);
                    }
                }
            } 
        }
    }
}