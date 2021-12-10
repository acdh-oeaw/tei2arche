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
        // retrieving id und data-target for further usage           
        var list_id = $(this).attr('id');
        var url = $(this).attr('data-target');
        // activates loader
        var delayInMilliseconds = 500; //.5 second
        var create_spinner = document.createElement('div');
        create_spinner.setAttribute('class','spinner-border active');
        create_spinner.setAttribute('role','status');
        create_spinner.setAttribute('id',list_id + '_spinner');
        this.appendChild(create_spinner);
        var host = "https://arche-curation.acdh-dev.oeaw.ac.at/api";
        var format = "application/n-triples";
        var resourceId = "/562500/";
        var readMode = 'neighbors';
        webpackARCHE.ARCHE_downloader(host, resourceId, format, readMode, function(rs) {
            if (editions.readyState === 4) {
                if (editions.status === 200) {
                    var contextNode = editions.responseXML;
                    // XPath Expressions
                    var hasTitleExp = "//ns0:Resource/ns0:hasTitle";
                    var rdfAboutExp = "//ns0:Resource/@rdf:about";
                    // Namespace resolver
                    var evaluator = new XPathEvaluator();
                    var resolver = evaluator.createNSResolver(contextNode.documentElement);
                    // XPath search for hasTitle
                    var xpathResultTitle = evaluator.evaluate(hasTitleExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                    // XPath search for rdfAbout
                    var xpathResultAbout = evaluator.evaluate(rdfAboutExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);                    
                    // Processing response data
                    var i;
                    var len = xpathResultTitle.snapshotLength;                    
                    if (len !== 0) {
                        // second loop needed to create li for each item
                        for (item = 0; item < len; item++) {                                      
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
                            // add the hasTitle as span object
                            var title = xpathResultTitle.snapshotItem(item).textContent;
                            var gui = spanStartS + title + spanEnd;
                            // create gui link for ARCHE                           
                            var gui_link = xpathResultAbout.snapshotItem(item).textContent.replace('/api/','/browser/oeaw_detail/');                                                                                
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
                                                'GUI-access' + 
                                                aClose;
                            // create RDF/XML link 
                            var rdf_xml_link = xpathResultAbout.snapshotItem(item).textContent + '/metadata?format=application/rdf%2Bxml';                            
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
                            var rdf_turtle_link = xpathResultAbout.snapshotItem(item).textContent + '/metadata';                    
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
                                    "text" : spanStartM + title + gui_access + rdf_xml + rdf_turtle + spanEnd 
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
                                "text" : "Keine Resourcen gefunden!" 
                            }, 
                            "last"
                        ); 
                    } 
                    // deactivates/remove loader
                    $('#' + list_id + '_spinner').remove();                                                   
                }
            }            
        });        
    });
});
$(function () {
    // create an instance when the DOM is ready
    $('#jstree2').jstree({
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
                    "themes",
                ]
    }).on('create_node.jstree', function(e, data) {
        console.log('saved');
    });
    var to = false;
    $('#plugins4_p').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $('#plugins4_p').val();
            $('#jstree2').jstree(true).search(v);
        },
        250);
    });
    $('#jstree2').on('click', '.multiple-leaf a', function () {
        $(this).setAttribute('target', '_blank');
        window.location = $(this).attr('href');
    });
    // bind to events triggered on the tree
    $('#jstree2').on('changed.jstree', function (e, data) {
        console.log(data.selected);
        // newly selected
        console.log(data.changed.deselected);
        // newly deselected
    });
    // click function on list item to add resources from clicked ARCHE collection
    $('.child_col_en').on("click",function () {        
        // retrieving id und data-target for further usage           
        var list_id = $(this).attr('id');
        var url = $(this).attr('data-target');
        // activates loader
        var delayInMilliseconds = 500; //.5 second
        var create_spinner2 = document.createElement('div');
        create_spinner2.setAttribute('class','spinner-border active');
        create_spinner2.setAttribute('role','status');
        create_spinner2.setAttribute('id',list_id + '_spinner');
        this.appendChild(create_spinner2);
        // create XMLHttpRequest
        var editions = new XMLHttpRequest();
        editions.open("GET", url, true);
        editions.onload = function(){
            if (editions.readyState === 4) {
                if (editions.status === 200) {
                    var contextNode = editions.responseXML;
                    // XPath Expressions
                    var hasTitleExp = "//ns0:Resource/ns0:hasTitle";
                    var rdfAboutExp = "//ns0:Resource/@rdf:about";
                    // Namespace resolver
                    var evaluator = new XPathEvaluator();
                    var resolver = evaluator.createNSResolver(contextNode.documentElement);
                    // XPath search for hasTitle
                    var xpathResultTitle = evaluator.evaluate(hasTitleExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                    // XPath search for rdfAbout
                    var xpathResultAbout = evaluator.evaluate(rdfAboutExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                    // Processing response data
                    var i;
                    var len = xpathResultTitle.snapshotLength;                  
                    if (len !== 0) {
                        // second loop needed to create li for each item
                        for (item = 0; item < len; item++) {                                      
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
                            // add the hasTitle as span object
                            var title = xpathResultTitle.snapshotItem(item).textContent;
                            var gui = spanStartS + title + spanEnd;
                            // create gui link for ARCHE                           
                            var gui_link = xpathResultAbout.snapshotItem(item).textContent.replace('/api/','/browser/oeaw_detail/');                                                                                
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
                                                'GUI-access' + 
                                                aClose;
                            // create RDF/XML link 
                            var rdf_xml_link = xpathResultAbout.snapshotItem(item).textContent + '/metadata?format=application/rdf%2Bxml';                            
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
                            var rdf_turtle_link = xpathResultAbout.snapshotItem(item).textContent + '/metadata';                    
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
                            $('#jstree2').jstree().create_node(
                                list_id ,  
                                { 
                                    "id" : set_id, 
                                    "text" : spanStartM + title + gui_access + rdf_xml + rdf_turtle + spanEnd 
                                }, 
                                "last"
                            );                            
                        } 
                    } else {
                        // add new node to jstree
                        $('#jstree2').jstree().create_node(
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
                }
            }            
        };
        editions.send(null);
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