<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_navbar_to_body</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied to html:body above page content.</p>
            <p>The template "add_navbar_to_body" containes the basic ACDH-CH fundament navbar.</p>     
        </desc>    
    </doc>
    
    <xsl:param name="transform"/>    
    <xsl:param name="title"/>
    <xsl:param name="arche_root_col_url"/>    
    <xsl:param name="tei-source"/>   
    <xsl:param name="collection-name"/>
    <xsl:param name="image-url"/>
    <xsl:param name="navbar-color"/> 
    <xsl:param name="arche_child_col_url"/>
        
    <xsl:template name="navbar">
        <!-- ******************* The Navbar Area ******************* -->                    
        <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="" itemtype="http://schema.org/WebSite">
            <a class="skip-link screen-reader-text sr-only" href="#single-wrapper">Skip to content</a>                             
            <nav class="navbar navbar-expand-lg {$navbar-color}">
                <div class="container" style="max-width:100% !important;">   
                    <a href="{concat($tei-source,$transform)}" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="{$image-url}" class="img-fluid" alt="" itemprop="logo"/></a>
                    <a class="navbar-brand site-title-with-logo" id="project_title" rel="home" href="{concat($tei-source,$transform)}" title="{$title}" itemprop="url"><xsl:value-of select="$collection-name"/></a>
                    <span style="margin-left:-1.7em;" class="badge bg-light text-dark">Beta</span>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                        <ul id="main-menu" class="nav nav-pills">
                            
                            <!-- ########## Navbar Links import ########### -->
                            <xsl:call-template name="navbar-links"/>
                            
                            <li class="dropdown nav-item">
                                <a class="bi bi-sliders dropdown-toggle nav-link" data-toggle="dropdown" href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z"/>
                                    </svg>
                                </a>
                                <ul class="dropdown-menu pull-left {$navbar-color}" role="menu" aria-labelledby="dropdownMenu">                                        
                                    <li class="dropdown-submenu pull-left nav-item">
                                        <a title="Language" class="nav-link" href="#" tabindex="-1">
                                            Language
                                        </a>
                                        <ul class="dropdown-menu {$navbar-color}">
                                            <li class="nav-item"><a tabindex="-1" href="#de" data-key="de" class="nav-link" onclick="changeLanguage('de')">Deutsch</a></li>
                                            <li class="nav-item"><a tabindex="-1" href="#en" data-key="en" class="nav-link" onclick="changeLanguage('en')">English</a></li>
                                        </ul>                               
                                    </li>
                                    <li class="dropdown-submenu pull-left nav-item">
                                        <a title="Colors" class="nav-link" href="#" tabindex="-1">
                                            Change Color
                                        </a>
                                        <ul class="dropdown-menu pull-left {$navbar-color}">
                                            <li class="nav-item"><a tabindex="1" href="#default" data-theme="default" class="theme-link nav-link">default</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#slate" data-theme="slate" class="theme-link nav-link">slate</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#simplex" data-theme="simplex" class="theme-link nav-link">simplex</a></li>                                            
                                            <li class="nav-item"><a tabindex="1" href="#lux" data-theme="lux" class="theme-link nav-link">lux</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#solar" data-theme="solar" class="theme-link nav-link">solar</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#yeti" data-theme="yeti" class="theme-link nav-link">yeti</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#pulse" data-theme="pulse" class="theme-link nav-link">pulse</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#minty" data-theme="minty" class="theme-link nav-link">minty</a></li>
                                            <li class="nav-item"><a tabindex="1" href="#flaty" data-theme="flaty" class="theme-link nav-link">flaty</a></li> 
                                            <li class="nav-item"><a tabindex="1" href="#journal" data-theme="journal" class="theme-link nav-link">journal</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li><!-- dropdown -->
                        </ul>
                        <form class="form-inline my-2 my-lg-0 navbar-search-form">
                            <input class="form-control navbar-search body_translations" id="searchInput" name="q" type="text" title="Suchen..." placeholder="..." autocomplete="off"></input>
                            <button type="submit" class="navbar-search-icon" id="searchBtn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                            </button>                            
                        </form>
                    </div><!-- .collapse navbar-collapse -->
                </div><!-- .container -->                            
            </nav><!-- .site-navigation -->                        
        </div><!-- .wrapper-navbar end --> 
    </xsl:template>
</xsl:stylesheet>