$(function () {
    // create an instance when the DOM is ready
    $('#jstree').jstree({
        "core" : {
            "themes" : {
                "variant" : "large",
                "dots" : true
            },
            "check_callback" : true
        },
        "search": {
            "case_insensitive": false,
            "show_only_matches": true
        },
        "plugins" :[
                    "search",
                    "changed",
                    "types",
                    "state",
                    "themes"
                    //"contextmenu"
                ]

        /*"contextmenu":{         
            "items": {
                "create": {
                    "label": "Add",
                    "action": function (obj) {
                        $('#jstree').jstree().create_node('#' ,  { "id" : "ajson5", "text" : "newly added" }, "last", function(){
                            alert("done");
                        }); 
                    },
                }
            }
        }*/
    }).on('create_node.jstree', function(e, data) {
        console.log('saved');
    });
    var to = false;
    $('#plugins4_q').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $('#plugins4_q').val();
            $('#jstree').jstree(true).search(v);
        },
        250);
    });
    $('#jstree').on('click', '.multiple-leaf a', function () {
        $(this).setAttribute('target', '_blank');
        window.location = $(this).attr('href');
    });
    // bind to events triggered on the tree
    $('#jstree').on('changed.jstree', function (e, data) {
        console.log(data.selected);
        // newly selected
        console.log(data.changed.deselected);
        // newly deselected
    });
    // click function on list item to add resources from clicked ARCHE collection
    $('.child_col_de').on("click",function () {
        const downloader = ARCHEapi.ARCHEdownloadResourceIdM;
        const query = ARCHEapi.ARCHErdfQuery;
        const match = ARCHEapi.ARCHEmatchJSON;        
        // retrieving id und data-target for further usage           
        var list_id = $(this).attr('id');
        var url = $(this).attr('data-target');
        // activates loader
        var create_spinner2 = document.createElement('div');
        create_spinner2.setAttribute('class','spinner-border active');
        create_spinner2.setAttribute('role','status');
        create_spinner2.setAttribute('id',list_id + '_spinner');
        this.appendChild(create_spinner2);
        var host = "https://arche.acdh.oeaw.ac.at/api";
        var format = "application/n-triples";
        var resourceId = url.replace('/metadata?format=application/rdf%2Bxml','').replace('https://arche.acdh.oeaw.ac.at/api/','');
        var readMode = 'relatives';
        downloader(host, resourceId, format, readMode, function(rs) {
            var subject = null;
            var predicate = "https://vocabs.acdh.oeaw.ac.at/schema#isPartOf";
            var object = host + '/' + resourceId;
            var resources = query(subject, predicate, object, rs);  
            var s = null;
            var p = "https://vocabs.acdh.oeaw.ac.at/schema#hasTitle";
            var o = null;
            var titles = query(s, p, o, rs);
            var subject = null;
            var predicate = "https://vocabs.acdh.oeaw.ac.at/schema#hasIdentifier";
            var object = null;
            var files = query(subject, predicate, object, rs);
            var result = match(resources, titles); 
            var result2 = match(resources, files);
            var result3 = [];
            for (var i = 0; i < result2.length; i++){
                if (result2[i].object.includes('https://id.acdh.oeaw.ac.at')) {
                    if (!result2[i].object.includes('https://id.acdh.oeaw.ac.at/cmdi')) {
                        result3.push(
                            {
                                "subject": result2[i].subject, 
                                "predicte": result2[i].predicate, 
                                "object": result2[i].object
                            }
                        ) 
                    }                       
                }
            }                                        
            var browser = "/browser/oeaw_detail/";
            var rdfxml = "/metadata?format=application/rdf%2Bxml";
            var turtle = "/metadata";
            var transform = "?format=customTei2Html";
            // Processing response data
            var len = result.length;                  
            if (len !== 0) {
                // create_node needs a string to add data
                    // the following variables build html as string
                    var spanStartS = '<span>';
                    var spanStartM = '<span class="multiple-leaf">';
                    var aStart = '<a ';
                    var hrefOpen = 'href="';
                    var classOpen = ' class="';
                    var targetOpen = ' target="';
                    var close = '"';
                    var aEnd = '>';
                    var aClose = '</a>'
                    var spanEnd = '</span>';
                    var className = 'res-act-button';
                // second loop needed to create li for each item
                for (item = 0; item < len; item++) {                                     
                    // add the hasTitle as span object
                    var title = result[item].object;
                    var gui = spanStartS + title + spanEnd;
                    // document transform tei
                    var transform_tei_link = result3[item].object + transform;                                                                          
                    var transform_tei = aStart + 
                                        hrefOpen + 
                                        transform_tei_link + 
                                        close + 
                                        classOpen + 
                                        className + 
                                        close + 
                                        targetOpen + '_blank' + 
                                        close + 
                                        aEnd + 
                                        'TEI zu HTML' + 
                                        aClose;
                    // document download tei                                             
                    var download_tei_link = result[item].subject;                                                                                
                    var download_tei = aStart + 
                                        hrefOpen + 
                                        download_tei_link + 
                                        close + 
                                        classOpen + 
                                        className + 
                                        close + 
                                        targetOpen + '_blank' + 
                                        close + 
                                        aEnd + 
                                        'TEI herunterladen' + 
                                        aClose;
                    // create gui link for ARCHE                           
                    var gui_link = result[item].subject.replace('/api/', browser);                                                                                
                    var gui_access = aStart + 
                                        hrefOpen + 
                                        gui_link + 
                                        close + 
                                        classOpen + 
                                        className + 
                                        close + 
                                        targetOpen + '_blank' + 
                                        close + 
                                        aEnd + 
                                        'GUI-Zugriff' + 
                                        aClose;
                    // create RDF/XML link 
                    var rdf_xml_link = result[item].subject + rdfxml;                            
                    var rdf_xml = aStart + 
                                        hrefOpen + 
                                        rdf_xml_link + 
                                        close + 
                                        classOpen + 
                                        className + 
                                        close + 
                                        targetOpen + '_blank' + 
                                        close + 
                                        aEnd + 
                                        'RDF/XML' + 
                                        aClose;
                    // create RDF/Turtle link 
                    var rdf_turtle_link = result[item].subject + turtle;                    
                    var rdf_turtle = aStart + 
                                        hrefOpen + 
                                        rdf_turtle_link + 
                                        close + 
                                        classOpen + 
                                        className + 
                                        close + 
                                        targetOpen + '_blank' + 
                                        close + 
                                        aEnd + 
                                        'RDF/Turtle' + 
                                        aClose;
                    // create new id for new nodes
                    var set_id = list_id + '_' + item;
                    // add new node to jstree
                    $('#jstree').jstree().create_node(
                        list_id ,  
                        { 
                            "id" : set_id, 
                            "text" : spanStartM + gui + transform_tei + download_tei + gui_access + rdf_xml + rdf_turtle + spanEnd 
                        }, 
                        "last"
                    );                            
                } 
            } else {
                // add new node to jstree
                $('#jstree').jstree().create_node(
                    list_id ,  
                    { 
                        "id" : list_id + "_not_found", 
                        "text" : "No Resources found!" 
                    }, 
                    "last"
                ); 
            }                                          
            // deactivates/remove loader
            $('#' + list_id + '_spinner').remove();                                         
        });
    });
});
// bind to events triggered on the tree
$(document).ready(function () {
    var leaf_de = document.getElementsByClassName('child_col_de');    
    for (var i = 0; i < leaf_de.length; i++) {
        leaf_de[i].classList.remove('jstree-leaf');
        leaf_de[i].classList.add('jstree-last');
        leaf_de[i].classList.add('jstree-closed');
    }
    var leaf_en = document.getElementsByClassName('child_col_en');    
    for (var i = 0; i < leaf_en.length; i++) {
        leaf_en[i].classList.remove('jstree-leaf');
        leaf_en[i].classList.add('jstree-last');
        leaf_en[i].classList.add('jstree-closed');
    }
});