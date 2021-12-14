 $(function (){
    // removes class jstree-leaf for list item to show arrow
    // adds class jstree-last
    var leaf = document.getElementsByClassName('child_col');    
    for (var i = 0; i < leaf.length; i++) {
        var non_leaf = leaf[i].classList.remove('jstree-leaf');
        var last_leaf = leaf[1].classList.add('jstree-last');
    }
    // click function on list item
    $('.child_col').click(function loadResources () {
        // retrieving id und data-target for further usage           
        var list_id = $(this).attr('id');
        var url = $(this).attr('data-target');
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
                    var ul = document.createElement('ul');
                    ul.setAttribute('class','jstree-children');
                    ul.setAttribute('role','group');                    
                    for (i = 0; i < len; i++) {
                        // second loop needed to create li for each item
                        for (item = 0; item < len; item++) {
                            // create a html li item that includes an i and a object
                            // classes from jstree for li element
                            li = document.createElement('li');
                            li.setAttribute('class','jstree-node tree-li jstree-leaf');
                            li.setAttribute('role','treeitem');
                            li.setAttribute('aria-selected','false');
                            li.setAttribute('aria-level','3');
                            var set_id = list_id + '_' + item;
                            var set_label = set_id + '_anchor';
                            li.setAttribute('id',set_id);
                            li.setAttribute('aria-labelledby',set_label);
                            li.setAttribute('aria-expanded','true');
                            // create jstree i element
                            i = document.createElement('i');
                            i.setAttribute('class','jstree-icon jstree-ocl');
                            i.setAttribute('role','presentation');
                            li.appendChild(i);                            
                            // create a element as jstree link                         
                            a = document.createElement('a');
                            a.setAttribute('id',set_label);
                            a.setAttribute('class','jstree-anchor');
                            a.setAttribute('href','#');
                            a.setAttribute('tabindex','-1');                            
                            // create span item for hasTitle and arche links
                            spanLinks = document.createElement('span');
                            spanLinks.setAttribute('class','multiple-leaf');
                            spanTitle = document.createElement('span');
                            // add the hasTitle as span object
                            spanTitle.appendChild(document.createTextNode(xpathResultTitle.snapshotItem(item).textContent));
                            // add span element with multiple items
                            spanLinks.appendChild(spanTitle);
                            // a1 = rdf:about arche gui link
                            a1 = document.createElement('a');
                            a1.appendChild(document.createTextNode('GUI-access'));
                            a1.setAttribute('href',xpathResultAbout.snapshotItem(item).textContent.replace('/api/','/browser/oeaw_detail/'));
                            a1.setAttribute('class','res-act-button');
                            a1.setAttribute('target','_blank');
                            a1.setAttribute('title','GUI-access');
                            // a2 = rdf:about arche RDF/XML link
                            a2 = document.createElement('a');
                            a2.appendChild(document.createTextNode('RDF/XML'));
                            a2.setAttribute('href',xpathResultAbout.snapshotItem(item).textContent + '/metadata?format=application/rdf%2Bxml');
                            a2.setAttribute('class','res-act-button');
                            a2.setAttribute('target','_blank');
                            a2.setAttribute('title','RDF/XML');
                            // a3 = rdf:about arche RDF/Turtle link
                            a3 = document.createElement('a');
                            a3.appendChild(document.createTextNode('RDF/Turtle'));
                            a3.setAttribute('href',xpathResultAbout.snapshotItem(item).textContent + '/metadata');
                            a3.setAttribute('class','res-act-button');
                            a3.setAttribute('target','_blank');
                            a3.setAttribute('title','RDF/Turtle');
                            // append links to span object
                            spanLinks.appendChild(a1);
                            spanLinks.appendChild(a2);
                            spanLinks.appendChild(a3);
                            // create second i object as themeicon
                            i2 = document.createElement('i');
                            i2.setAttribute('class','jstree-icon jstree-themeicon');
                            i2.setAttribute('role','presentation');
                            // append i2 and span to a
                            a.appendChild(i2);
                            a.appendChild(spanLinks);
                            // append all objects in a to list item
                            li.appendChild(a);
                            // append everything to ul list
                            ul.appendChild(li);
                        }                        
                    }
                    // append ul list to jstree list item as sublist
                    document.getElementById(list_id).appendChild(ul);               
                    // change class of jstree list item to open
                    document.getElementById(list_id).classList.add('jstree-open');             
                }
            }            
        };
        document.getElementById(list_id).removeEventListener('click', loadResources, true);
        editions.send(null);         
    });   
 });
    