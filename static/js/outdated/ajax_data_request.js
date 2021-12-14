$('#ajax_request').click(function () {
    // CSS tansformations to show loader and hide content
    if (document.getElementById('leaflet-map-one') !== null) {
        var leafletMap = document.getElementById("leaflet-map-one");
        leafletMap.classList.add('fade'); 
        leafletMap.removeAttribute('id');
    }
    var delayInMilliseconds = 1500; //1,5 second
    var loaderWrapper = document.getElementById("loader_combo_wrapper");
    var progressWrapper = document.getElementById("progressWrapper");
    var progress = document.getElementById("progressBar");
    var loader = document.getElementById("loader");
    var loaderEnd = document.getElementById("loaderEnd");
    var elementHome = document.getElementById("home");
    var elementAbout = document.getElementById("about");
    var elementTransform = document.getElementById("transform");
    var elementAjax = document.getElementById("edition");
    var navLinks = document.getElementsByClassName("nav-link");
    elementAbout.classList.remove('active');
    elementAbout.classList.add('fade');
    elementTransform.classList.remove('active');
    elementTransform.classList.add('fade');
    elementHome.classList.remove('active');
    elementHome.classList.add('fade');
    navLinks[0].classList.remove('active');               
    navLinks[0].classList.remove('show');
    navLinks[1].classList.remove('active');               
    navLinks[1].classList.remove('show');
    navLinks[2].classList.remove('active');               
    navLinks[2].classList.remove('show');
    elementAjax.classList.remove('fade');
    elementAjax.classList.add('active');
    // Create XMLHttpRequest
    var editions = new XMLHttpRequest();
    var url = document.getElementById("child_col_url").textContent;
    editions.open("GET", url, true);
    progress.setAttribute('style', 'width:15%;');
    progress.setAttribute('aria-valuenow', '15');
    editions.onload = function () {
        if (editions.readyState === 4) {
            if (editions.status === 200) {
                progress.setAttribute('style', 'width:25%;');
                progress.setAttribute('aria-valuenow', '25');
                var contextNode = editions.responseXML;
                // XPath Expressions
                var hasTitleExp = "//ns0:Resource/ns0:hasTitle";
                var hasFilenameExp = "//ns0:Resource/ns0:hasFilename";
                var hasCustomXslExp = "//ns0:Resource/ns0:hasCustomXsl";
                var rdfAboutExp = "//ns0:Resource/@rdf:about";
                // Namespace resolver
                var evaluator = new XPathEvaluator();
                var resolver = evaluator.createNSResolver(contextNode.documentElement);
                // XPath search for hasTitle
                var xpathResultTitle = evaluator.evaluate(hasTitleExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                // XPath search for hasFilename
                var xpathResultFilename = evaluator.evaluate(hasFilenameExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                // XPath search for hasCustomXsl
                var xpathResultXsl = evaluator.evaluate(hasCustomXslExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                // XPath search for @rdf:about
                var xpathResultAbout = evaluator.evaluate(rdfAboutExp, contextNode.documentElement, resolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
                // Processing data from xpathResult.. files
                var tbody = document.createElement('tbody');
                var teiSource = "https://service4tei.acdh-dev.oeaw.ac.at/?tei=";
                var editionFolder = "https://id.acdh.oeaw.ac.at/thun/editions/";
                progress.setAttribute('style', 'width:50%;');
                progress.setAttribute('aria-valuenow', '50');
                var i;
                var len = xpathResultTitle.snapshotLength;
                for (i = 0; i < len; i++) {
                    var tr = document.createElement('tr');
                    var td = document.createElement('td');
                    var td2 = document.createElement('td');
                    var td3 = document.createElement('td');
                    var td4 = document.createElement('td');
                    var td5 = document.createElement('td');
                    // cell one
                    td.appendChild(document.createTextNode(xpathResultTitle.snapshotItem(i).textContent));
                    tr.appendChild(td);
                    // cell two
                    var a = document.createElement('a');
                    a.appendChild(document.createTextNode('Öffnen'));
                    var xslTrans = xpathResultXsl.snapshotItem(i).textContent;
                    a.setAttribute("href", teiSource + editionFolder + xpathResultFilename.snapshotItem(i).textContent + '&xsl=' + xslTrans);
                    a.setAttribute("target","_blank");
                    a.setAttribute("title","Öffnen");
                    a.setAttribute("class","body_translations");
                    td2.appendChild(a);
                    tr.appendChild(td2);
                    // cell three
                    var a2 = document.createElement('a');
                    a2.appendChild(document.createTextNode('Öffnen'));
                    var browser = "/browser/oeaw_detail/";
                    a2.setAttribute("href", xpathResultAbout.snapshotItem(i).textContent.replace("/api/",browser));
                    a2.setAttribute("target","_blank");
                    a.setAttribute("target","_blank");
                    a.setAttribute("title","Öffnen");
                    a.setAttribute("class","body_translations");
                    td3.appendChild(a2);
                    tr.appendChild(td3);
                    // cell four
                    var a3 = document.createElement('a');
                    a3.appendChild(document.createTextNode('Öffnen'));
                    var rdfxml = "/metadata?format=application/rdf%2Bxml";
                    a3.setAttribute("href", xpathResultAbout.snapshotItem(i).textContent + rdfxml);
                    a3.setAttribute("target","_blank");
                    a.setAttribute("target","_blank");
                    a.setAttribute("title","Öffnen");
                    a.setAttribute("class","body_translations");
                    td4.appendChild(a3);
                    tr.appendChild(td4);
                    // cell five
                    var a4 = document.createElement('a');
                    a4.appendChild(document.createTextNode('Öffnen'));
                    var turtle = "/metadata";
                    a4.setAttribute("href", xpathResultAbout.snapshotItem(i).textContent + turtle);
                    a4.setAttribute("target","_blank");
                    a.setAttribute("target","_blank");
                    a.setAttribute("title","Öffnen");
                    a.setAttribute("class","body_translations");
                    td5.appendChild(a4);
                    tr.appendChild(td5);                    
                    // add cells to row                 
                    tbody.appendChild(tr);
                }
                progress.setAttribute('style', 'width:75%;');
                progress.setAttribute('aria-valuenow', '75');
                // timeout function to delay loading and show progressBar
                setTimeout(function() {
                    //your code to be executed after 1,5 second
                    // Add rows to HTML tbody
                    document.getElementById('tableAjax').appendChild(tbody);
                    // if statement required for cached table otherwise already initialised table throws error
                    if (document.getElementById("tableAjax_wrapper") === null) {
                       // Transform table to DataTable
                        $('#tableAjax').DataTable({
                            "language": {
                                "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
                            },
                            dom: 'fpBirtp',
                            buttons:['copy', 'excel', 'pdf'],
                            "lengthMenu":[25, 50, 75, 100, "All"],
                            responsive: true,
                            orderCellsTop: true,
                            "pageLength": 50,
                            keepConditions: true                    
                        }); 
                    }                    
                    progress.setAttribute('style', 'width:100%;');
                    progress.setAttribute('aria-valuenow', '100');
                    // timeout function to delay loading and show progressBar                    
                    setTimeout(function() {
                        //your code to be executed after 1,5 second
                        // Hide loader animation and show content
                        loaderWrapper.setAttribute('class','fade');
                        loader.removeAttribute('class');
                        loader.removeAttribute('style');                        
                        progressWrapper.removeAttribute('class');
                        progressWrapper.removeAttribute('style');                        
                        progress.removeAttribute('class');
                        loaderEnd.classList.remove('fade');               
                        loaderEnd.classList.add('active');                        
                    }, delayInMilliseconds);
                }, delayInMilliseconds);     
            } else {
                alert(error(editions.statusText));
            }
        }
    };              
    editions.send(null);            
});