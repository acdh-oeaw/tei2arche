$("#load_arche_metadata").on("click", function() {
    if ($(".loading_animation_head").length !== 0) {
        // CSS tansformations to show loader and hide content
        $("#transform").removeClass("active").addClass("fade");
        $("#home").removeClass("active").addClass("fade");
        $("#search").removeClass("active").addClass("fade");
        $("#edition").removeClass("active").addClass("fade");
        $("#about").removeClass("fade").addClass("active");
        $(".nav-link").removeClass("active show");
        var create_spinner =    `<div id="loader_wrapper" class="text-center"> 
                                    <div class="spinner-border active" role="status" 
                                        id="xyz_spinner" style="width: 5rem; height: 5rem;"
                                        </div>
                                </div>`;        
        $('#single-wrapper').prepend(create_spinner); 
        var project_title = $('#project-xsl').text().toLowerCase().replace('\\s','_');
        if (localStorage.getItem(project_title.replace(".xsl","") + "_metadata") == null) {
            const downloader = ARCHEapi.ARCHEdownloadResourceIdM;
            const query = ARCHEapi.ARCHErdfQuery;
            var host = "https://arche-dev.acdh-dev.oeaw.ac.at/api";
            var format = "application/n-triples";
            var col_url = $('#root_col_url').text();
            var resourceId = col_url.replace(host + '/','');
            var readMode = 'neighbors';
            downloader(host, resourceId, format, readMode, (rs) => {
                var subject = col_url;  
                var predicate = null;
                var object = null;
                var topCollection = query(subject, predicate, object, rs);
                var topCollection = {
                    data: topCollection
                };
                createMetaDataTable(topCollection, project_title, query, rs);
                localStorage.setItem(project_title.replace(".xsl","") + "_metadata", JSON.stringify(topCollection));
            }); 
        } else {
            var topCollection = JSON.parse(localStorage.getItem(project_title.replace(".xsl","") + "_metadata"));
            var metdata_title_cache = JSON.parse(localStorage.getItem(project_title.replace(".xsl","") + "_metadata_titles"));
            createMetaDataTable2(topCollection, metdata_title_cache);
        }
    }       
});

function createMetaDataTable(topCollection, project_title, query, rs) {
    var arche = "https://vocabs.acdh.oeaw.ac.at/schema#";
    var browser = "/browser/oeaw_detail/";
    var regex = new RegExp('@\\w+');
    var accessRestrictions = "<tr><th>Zugriffsbeschränkung</th>";
    var owners = "<tr><th>Principal Investigator</th>";
    var contacts = "<tr><th>Kontakt(e)</th>";
    var contributors = '<tr><th>Mitwirkende(r)</th>';
    var creators = '<tr><th>AutorIn</th>';
    var curators = '<tr><th>KuratorIn</th>';
    var licensors = '<tr><th>LizenzgeberIn</th>';
    var licenses = '<tr><th>Lizenz</th>';
    var relatedDisciplines = '<tr><th>Verwandte Discipline</th>';
    var relatedProjects = '<tr><th>Verwandtes Projekt</th>';
    for (var i = 0; i < topCollection.data.length; i++) {
        if (topCollection.data[i].object.includes('@de') || !topCollection.data[i].object.includes('@')){
            createMetaFirst(topCollection, i);
            if (topCollection.data[i].predicate == arche + "hasAccessRestrictionSummary") {
                accessRestrictions += `<td>${topCollection.data[i].object.replace(regex,'')}</td>`;          
            }  
            else if (topCollection.data[i].predicate == arche + "hasOwner") {
                var owner = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                owners += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${owner[0].object.replace(regex,'')}</a></td>`;
            }
            else if (topCollection.data[i].predicate == arche + "hasContact") {
                var contact = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                contacts += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${contact[0].object.replace(regex,'')}</a></td>`; 
            }
            else if (topCollection.data[i].predicate == arche + "hasContributor") {
                var contributor = query(topCollection.data[i].object, null, null, rs);
                for (e = 0; e < contributor.length; e++) {
                    if (contributor[e].predicate == arche + "hasTitle") {
                        if (contributor[e].object.includes('@de') || !contributor[e].object.includes('@')){
                            contributors += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${contributor[e].object.replace(regex,'')}</a></td>`; 
                        }
                    }
                }             
            }
            else if (topCollection.data[i].predicate == arche + "hasCreator") {
                var creator = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                creators += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${creator[0].object.replace(regex,'')}</a></td>`;          
            }
            else if (topCollection.data[i].predicate == arche + "hasCurator") {
                var curator = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                curators += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${curator[0].object.replace(regex,'')}</a></td>`;             
            }
            else if (topCollection.data[i].predicate == arche + "hasLicensor") {
                var licensor = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                licensors += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${licensor[0].object.replace(regex,'')}</a></td>`;           
            }
            else if (topCollection.data[i].predicate == arche + "hasLicense") {
                var license = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                licenses += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${license[0].object.replace(regex,'')}</a></td>`;            
            }
            else if (topCollection.data[i].predicate == arche + "hasRelatedDiscipline") {
                var relatedDiscipline = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                relatedDisciplines += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${relatedDiscipline[0].object.replace(regex,'')}</a></td>`;            
            }
            else if (topCollection.data[i].predicate == arche + "hasRelatedProject") {
                var relatedProject = query(topCollection.data[i].object, arche + "hasTitle", null, rs);
                relatedProjects += `<td><a target="_blank" href="${topCollection.data[i].object.replace('/api/',browser)}">${relatedProject[0].object.replace(regex,'')}</a></td>`;           
            }     
        }                   
    }
    $("#metadata_person").append(owners + "</tr>").append(contacts + '</tr>').append(contributors + '</tr>').append(creators + '</tr>').append(curators + '</tr>');   
    $("#metadata_rights").append(accessRestrictions + "</tr>").append(licensors + '</tr>').append(licenses + '</tr>');   
    $("#metadata_others").append(relatedDisciplines + '</tr>').append(relatedProjects + '</tr>');  
    $(".loading_animation").remove();
    $(".loading_animation_head").remove();    
    $("#metadata_keyword").append("<h3>Schlagwörter</h3>");    
    $("#metadata_actor").append("<h3>Akteure</h3>");   
    $("#metadata_right").append("<h3>Rechte</h3>");   
    $("#metadata_other").append("<h3>Weitere Informationen</h3>");   
    $("#loader_wrapper").remove();         
    $("#aboutEnd").removeClass("fade").addClass("active");
    localStorage.setItem(project_title.replace(".xsl","") + "_metadata_titles", 
        JSON.stringify({
            metadata_titles:[{
                owners: owners,
                contacts: contacts,
                contributors: contributors,
                creators: creators,
                curators: curators,
                licensors: licensors,
                licenses: licenses,
                relatedDisciplines: relatedDisciplines,
                relatedProjects: relatedProjects,
                accessRestrictions: accessRestrictions
            }] 
        })
    ); 
};

function createMetaDataTable2(topCollection, metdata_title_cache) {
    for (var i = 0; i < topCollection.data.length; i++) {
        createMetaFirst(topCollection, i);
    }  
    for (var i = 0; i < metdata_title_cache.metadata_titles.length; i++) {
        if (metdata_title_cache.metadata_titles[i].owners) {
            $("#metadata_person").append(metdata_title_cache.metadata_titles[i].owners);
        }
        if (metdata_title_cache.metadata_titles[i].contacts) {
            $("#metadata_person").append(metdata_title_cache.metadata_titles[i].contacts);        
        }
        if (metdata_title_cache.metadata_titles[i].accessRestrictions) {
            $("#metadata_rights").append(metdata_title_cache.metadata_titles[i].accessRestrictions);   
        }
        if (metdata_title_cache.metadata_titles[i].contributors) {
            $("#metadata_person").append(metdata_title_cache.metadata_titles[i].contributors);     
        }
        if (metdata_title_cache.metadata_titles[i].creators) {
            $("#metadata_person").append(metdata_title_cache.metadata_titles[i].creators);       
        }
        if (metdata_title_cache.metadata_titles[i].curators) {
            $("#metadata_person").append(metdata_title_cache.metadata_titles[i].curators);              
        }
        if (metdata_title_cache.metadata_titles[i].licensors) {
            $("#metadata_rights").append(metdata_title_cache.metadata_titles[i].licensors);              
        }
        if (metdata_title_cache.metadata_titles[i].licenses) {
            $("#metadata_rights").append(metdata_title_cache.metadata_titles[i].licenses);               
        }
        if (metdata_title_cache.metadata_titles[i].relatedDisciplines) {
            $("#metadata_others").append(metdata_title_cache.metadata_titles[i].relatedDisciplines);              
        }
        if (metdata_title_cache.metadata_titles[i].relatedProjects) {
            $("#metadata_others").append(metdata_title_cache.metadata_titles[i].relatedProjects);            
        }
    }
    $(".loading_animation").remove();
    $(".loading_animation_head").remove();    
    $("#metadata_keyword").append("<h3>Schlagwörter</h3>");    
    $("#metadata_actor").append("<h3>Akteure</h3>");   
    $("#metadata_right").append("<h3>Rechte</h3>");   
    $("#metadata_other").append("<h3>Weitere Informationen</h3>");
    $("#loader_wrapper").remove();                   
    $("#aboutEnd").removeClass("fade").addClass("active");
};

function createMetaFirst(topCollection, i) {
    var arche = "https://vocabs.acdh.oeaw.ac.at/schema#";
    var regex = new RegExp('@\\w+');
    if (topCollection.data[i].predicate == arche + "hasTitle") {
        $("#metadata_title").append(`<h2>${topCollection.data[i].object.replace(regex,'')}</h2>`);
    }
    else if (topCollection.data[i].predicate == arche + "hasDescription") {
        $("#metadata_description").append(`<p>${topCollection.data[i].object.replace(regex,'')}</p>`);
    }
    else if (topCollection.data[i].predicate == arche + "hasSubject") {
        $("#metadata_keywords").append(`<li>${topCollection.data[i].object.replace(regex,'')}</li>`);              
    }
    else if (topCollection.data[i].predicate == arche + "hasCreatedStartDate") {
        $("#metadata_others").append(`<tr><th>Erstellungsdatum Anfang</th><td>${topCollection.data[i].object.replace("^^http://www.w3.org/2001/XMLSchema#date","")}</td></tr>`);
    }
    else if (topCollection.data[i].predicate == arche + "CreatedEndDate") {
        $("#metadata_others").append(`<tr><th>Erstellungsdatum Ende</th><td>${topCollection.data[i].object.replace("^^http://www.w3.org/2001/XMLSchema#date","")}</td></tr>`);
    }
    else if (topCollection.data[i].predicate == arche + "hasNumberOfItems") {
        $("#metadata_others").append(`<tr><th>Anzahl von Resourcen</th><td>${topCollection.data[i].object.replace("^^http://www.w3.org/2001/XMLSchema#decimal","")}</td></tr>`);
    }
};