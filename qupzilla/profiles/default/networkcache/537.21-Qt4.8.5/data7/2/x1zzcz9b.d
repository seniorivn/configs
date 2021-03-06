   �      whttps://duckduckgo.com/locales/ru_RU/LC_MESSAGES/duckduckgo-duckduckgo+sprintf+gettext+locale-simple.20131026.164123.js %|N &Q�  %|M N��         
     O K           �      Server   nginx   Content-Type   'application/x-javascript; charset=UTF-8   Last-Modified   Thu, 26 Dec 2013 01:25:45 GMT   Expires   Thu, 26 Dec 2013 20:41:51 GMT   Cache-Control   max-age=21600   Strict-Transport-Security   max-age=31536000   X-DuckDuckGo-Locale   ru_RU   Content-Encoding   gzip function sprintf(){var regex=/%%|%(\d+\$)?([-+\'#0 ]*)(\*\d+\$|\*|\d+)?(\.(\*\d+\$|\*|\d+))?([scboxXuidfegEG])/g;var a=arguments,i=0,format=a[i++];var pad=function(str,len,chr,leftJustify){if(!chr){chr=' ';}
var padding=(str.length>=len)?'':Array(1+len-str.length>>>0).join(chr);return leftJustify?str+padding:padding+str;};var justify=function(value,prefix,leftJustify,minWidth,zeroPad,customPadChar){var diff=minWidth-value.length;if(diff>0){if(leftJustify||!zeroPad){value=pad(value,minWidth,customPadChar,leftJustify);}else{value=value.slice(0,prefix.length)+pad('',diff,'0',true)+value.slice(prefix.length);}}
return value;};var formatBaseX=function(value,base,prefix,leftJustify,minWidth,precision,zeroPad){var number=value>>>0;prefix=prefix&&number&&{'2':'0b','8':'0','16':'0x'}[base]||'';value=prefix+pad(number.toString(base),precision||0,'0',false);return justify(value,prefix,leftJustify,minWidth,zeroPad);};var formatString=function(value,leftJustify,minWidth,precision,zeroPad,customPadChar){if(precision!=null){value=value.slice(0,precision);}
return justify(value,'',leftJustify,minWidth,zeroPad,customPadChar);};var doFormat=function(substring,valueIndex,flags,minWidth,_,precision,type){var number;var prefix;var method;var textTransform;var value;if(substring=='%%'){return'%';}
var leftJustify=false,positivePrefix='',zeroPad=false,prefixBaseX=false,customPadChar=' ';var flagsl=flags.length;for(var j=0;flags&&j<flagsl;j++){switch(flags.charAt(j)){case' ':positivePrefix=' ';break;case'+':positivePrefix='+';break;case'-':leftJustify=true;break;case"'":customPadChar=flags.charAt(j+1);break;case'0':zeroPad=true;break;case'#':prefixBaseX=true;break;}}
if(!minWidth){minWidth=0;}else if(minWidth=='*'){minWidth=+a[i++];}else if(minWidth.charAt(0)=='*'){minWidth=+a[minWidth.slice(1,-1)];}else{minWidth=+minWidth;}
if(minWidth<0){minWidth=-minWidth;leftJustify=true;}
if(!isFinite(minWidth)){throw new Error('sprintf: (minimum-)width must be finite');}
if(!precision){precision='fFeE'.indexOf(type)>-1?6:(type=='d')?0:undefined;}else if(precision=='*'){precision=+a[i++];}else if(precision.charAt(0)=='*'){precision=+a[precision.slice(1,-1)];}else{precision=+precision;}
value=valueIndex?a[valueIndex.slice(0,-1)]:a[i++];switch(type){case's':return formatString(String(value),leftJustify,minWidth,precision,zeroPad,customPadChar);case'c':return formatString(String.fromCharCode(+value),leftJustify,minWidth,precision,zeroPad);case'b':return formatBaseX(value,2,prefixBaseX,leftJustify,minWidth,precision,zeroPad);case'o':return formatBaseX(value,8,prefixBaseX,leftJustify,minWidth,precision,zeroPad);case'x':return formatBaseX(value,16,prefixBaseX,leftJustify,minWidth,precision,zeroPad);case'X':return formatBaseX(value,16,prefixBaseX,leftJustify,minWidth,precision,zeroPad).toUpperCase();case'u':return formatBaseX(value,10,prefixBaseX,leftJustify,minWidth,precision,zeroPad);case'i':case'd':number=(+value)|0;prefix=number<0?'-':positivePrefix;value=prefix+pad(String(Math.abs(number)),precision,'0',false);return justify(value,prefix,leftJustify,minWidth,zeroPad);case'e':case'E':case'f':case'F':case'g':case'G':number=+value;prefix=number<0?'-':positivePrefix;method=['toExponential','toFixed','toPrecision']['efg'.indexOf(type.toLowerCase())];textTransform=['toString','toUpperCase']['eEfFgG'.indexOf(type)%2];value=prefix+Math.abs(number)[method](precision);return justify(value,prefix,leftJustify,minWidth,zeroPad)[textTransform]();default:return substring;}};return format.replace(regex,doFormat);};/*
Pure Javascript implementation of Uniforum message translation.
Copyright (C) 2008 Joshua I. Miller <unrtst@cpan.org>, all rights reserved

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU Library General Public License as published
by the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Library General Public License for more details.

You should have received a copy of the GNU Library General Public
License along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
USA.

=head1 NAME

Javascript Gettext - Javascript implemenation of GNU Gettext API.

=head1 SYNOPSIS

 // //////////////////////////////////////////////////////////
 // Optimum caching way
 <script language="javascript" src="/path/LC_MESSAGES/myDomain.json"></script>
 <script language="javascript" src="/path/Gettext.js'></script>

 // assuming myDomain.json defines variable json_locale_data
 var params = {  "domain" : "myDomain",
                 "locale_data" : json_locale_data
              };
 var gt = new Gettext(params);
 // create a shortcut if you'd like
 function _ (msgid) { return gt.gettext(msgid); }
 alert(_("some string"));
 // or use fully named method
 alert(gt.gettext("some string"));
 // change to use a different "domain"
 gt.textdomain("anotherDomain");
 alert(gt.gettext("some string"));


 // //////////////////////////////////////////////////////////
 // The other way to load the language lookup is a "link" tag
 // Downside is that not all browsers cache XMLHttpRequests the
 // same way, so caching of the language data isn't guarenteed
 // across page loads.
 // Upside is that it's easy to specify multiple files
 <link rel="gettext" href="/path/LC_MESSAGES/myDomain.json" />
 <script language="javascript" src="/path/Gettext.js'></script>

 var gt = new Gettext({ "domain" : "myDomain" });
 // rest is the same


 // //////////////////////////////////////////////////////////
 // The reson the shortcuts aren't exported by default is because they'd be
 // glued to the single domain you created. So, if you're adding i18n support
 // to some js library, you should use it as so:

 if (typeof(MyNamespace) == 'undefined') MyNamespace = {};
 MyNamespace.MyClass = function () {
     var gtParms = { "domain" : 'MyNamespace_MyClass' };
     this.gt = new Gettext(gtParams);
     return this;
 };
 MyNamespace.MyClass.prototype._ = function (msgid) {
     return this.gt.gettext(msgid);
 };
 MyNamespace.MyClass.prototype.something = function () {
     var myString = this._("this will get translated");
 };

 // //////////////////////////////////////////////////////////
 // Adding the shortcuts to a global scope is easier. If that's
 // ok in your app, this is certainly easier.
 var myGettext = new Gettext({ 'domain' : 'myDomain' });
 function _ (msgid) {
     return myGettext.gettext(msgid);
 }
 alert( _("text") );

 // //////////////////////////////////////////////////////////
 // Data structure of the json data
 // NOTE: if you're loading via the <script> tag, you can only
 // load one file, but it can contain multiple domains.
 var json_locale_data = {
     "MyDomain" : {
         "" : {
             "header_key" : "header value",
             "header_key" : "header value",
         "msgid" : [ "msgid_plural", "msgstr", "msgstr_plural", "msgstr_pluralN" ],
         "msgctxt\004msgid" : [ null, "msgstr" ],
         },
     "AnotherDomain" : {
         },
     }

=head1 DESCRIPTION

This is a javascript implementation of GNU Gettext, providing internationalization support for javascript. It differs from existing javascript implementations in that it will support all current Gettext features (ex. plural and context support), and will also support loading language catalogs from .mo, .po, or preprocessed json files (converter included).

The locale initialization differs from that of GNU Gettext / POSIX. Rather than setting the category, domain, and paths, and letting the libs find the right file, you must explicitly load the file at some point. The "domain" will still be honored. Future versions may be expanded to include support for set_locale like features.


=head1 INSTALL

To install this module, simply copy the file lib/Gettext.js to a web accessable location, and reference it from your application.


=head1 CONFIGURATION

Configure in one of two ways:

=over

=item 1. Optimal. Load language definition from statically defined json data.

    <script language="javascript" src="/path/locale/domain.json"></script>

    // in domain.json
    json_locale_data = {
        "mydomain" : {
            // po header fields
            "" : {
                "plural-forms" : "...",
                "lang" : "en",
                },
            // all the msgid strings and translations
            "msgid" : [ "msgid_plural", "translation", "plural_translation" ],
        },
    };
    // please see the included bin/po2json script for the details on this format

This method also allows you to use unsupported file formats, so long as you can parse them into the above format.

=item 2. Use AJAX to load language file.

Use XMLHttpRequest (actually, SJAX - syncronous) to load an external resource.

Supported external formats are:

=over

=item * Javascript Object Notation (.json)

(see bin/po2json)

    type=application/json

=item * Uniforum Portable Object (.po)

(see GNU Gettext's xgettext)

    type=application/x-po

=item * Machine Object (compiled .po) (.mo)

NOTE: .mo format isn't actually supported just yet, but support is planned.

(see GNU Gettext's msgfmt)

    type=application/x-mo

=back

=back

=head1 METHODS

The following methods are implemented:

  new Gettext(args)
  textdomain  (domain)
  gettext     (msgid)
  dgettext    (domainname, msgid)
  dcgettext   (domainname, msgid, LC_MESSAGES)
  ngettext    (msgid, msgid_plural, count)
  dngettext   (domainname, msgid, msgid_plural, count)
  dcngettext  (domainname, msgid, msgid_plural, count, LC_MESSAGES)
  pgettext    (msgctxt, msgid)
  dpgettext   (domainname, msgctxt, msgid)
  dcpgettext  (domainname, msgctxt, msgid, LC_MESSAGES)
  npgettext   (msgctxt, msgid, msgid_plural, count)
  dnpgettext  (domainname, msgctxt, msgid, msgid_plural, count)
  dcnpgettext (domainname, msgctxt, msgid, msgid_plural, count, LC_MESSAGES)
  strargs     (string, args_array)


=head2 new Gettext (args)

Several methods of loading locale data are included. You may specify a plugin or alternative method of loading data by passing the data in as the "locale_data" option. For example:

    var get_locale_data = function () {
        // plugin does whatever to populate locale_data
        return locale_data;
    };
    var gt = new Gettext( 'domain' : 'messages',
                          'locale_data' : get_locale_data() );

The above can also be used if locale data is specified in a statically included <SCRIPT> tag. Just specify the variable name in the call to new. Ex:

    var gt = new Gettext( 'domain' : 'messages',
                          'locale_data' : json_locale_data_variable );

Finally, you may load the locale data by referencing it in a <LINK> tag. Simply exclude the 'locale_data' option, and all <LINK rel="gettext" ...> items will be tried. The <LINK> should be specified as:

    <link rel="gettext" type="application/json" href="/path/to/file.json">
    <link rel="gettext" type="text/javascript"  href="/path/to/file.json">
    <link rel="gettext" type="application/x-po" href="/path/to/file.po">
    <link rel="gettext" type="application/x-mo" href="/path/to/file.mo">

args:

=over

=item domain

The Gettext domain, not www.whatev.com. It's usually your applications basename. If the .po file was "myapp.po", this would be "myapp".

=item locale_data

Raw locale data (in json structure). If specified, from_link data will be ignored.

=back

=cut

*/
Gettext=function(args){this.domain='messages';this.locale_data=undefined;var options=["domain","locale_data"];if(this.isValidObject(args)){for(var i in args){for(var j=0;j<options.length;j++){if(i==options[j]){if(this.isValidObject(args[i]))
this[i]=args[i];}}}}
this.try_load_lang();return this;}
Gettext.context_glue="\004";Gettext._locale_data={};Gettext.prototype.try_load_lang=function(){if(typeof(this.locale_data)!='undefined'){var locale_copy=this.locale_data;this.locale_data=undefined;this.parse_locale_data(locale_copy);if(typeof(Gettext._locale_data[this.domain])=='undefined'){throw new Error("Error: Gettext 'locale_data' does not contain the domain '"+this.domain+"'");}}
var lang_link=this.get_lang_refs();if(typeof(lang_link)=='object'&&lang_link.length>0){for(var i=0;i<lang_link.length;i++){var link=lang_link[i];if(link.type=='application/json'){if(!this.try_load_lang_json(link.href)){throw new Error("Error: Gettext 'try_load_lang_json' failed. Unable to exec xmlhttprequest for link ["+link.href+"]");}}else if(link.type=='application/x-po'){if(!this.try_load_lang_po(link.href)){throw new Error("Error: Gettext 'try_load_lang_po' failed. Unable to exec xmlhttprequest for link ["+link.href+"]");}}else{throw new Error("TODO: link type ["+link.type+"] found, and support is planned, but not implemented at this time.");}}}};Gettext.prototype.parse_locale_data=function(locale_data){if(typeof(Gettext._locale_data)=='undefined'){Gettext._locale_data={};}
for(var domain in locale_data){if((!locale_data.hasOwnProperty(domain))||(!this.isValidObject(locale_data[domain])))
continue;var has_msgids=false;for(var msgid in locale_data[domain]){has_msgids=true;break;}
if(!has_msgids)continue;var data=locale_data[domain];if(domain=="")domain="messages";if(!this.isValidObject(Gettext._locale_data[domain]))
Gettext._locale_data[domain]={};if(!this.isValidObject(Gettext._locale_data[domain].head))
Gettext._locale_data[domain].head={};if(!this.isValidObject(Gettext._locale_data[domain].msgs))
Gettext._locale_data[domain].msgs={};for(var key in data){if(key==""){var header=data[key];for(var head in header){var h=head.toLowerCase();Gettext._locale_data[domain].head[h]=header[head];}}else{Gettext._locale_data[domain].msgs[key]=data[key];}}}
for(var domain in Gettext._locale_data){if(this.isValidObject(Gettext._locale_data[domain].head['plural-forms'])&&typeof(Gettext._locale_data[domain].head.plural_func)=='undefined'){var plural_forms=Gettext._locale_data[domain].head['plural-forms'];var pf_re=new RegExp('^(\\s*nplurals\\s*=\\s*[0-9]+\\s*;\\s*plural\\s*=\\s*(?:\\s|[-\\?\\|&=!<>+*/%:;a-zA-Z0-9_\(\)])+)','m');if(pf_re.test(plural_forms)){var pf=Gettext._locale_data[domain].head['plural-forms'];if(!/;\s*$/.test(pf))pf=pf.concat(';');var code='var plural; var nplurals; '+pf+' return { "nplural" : nplurals, "plural" : (plural === true ? 1 : plural ? plural : 0) };';Gettext._locale_data[domain].head.plural_func=new Function("n",code);}else{throw new Error("Syntax error in language file. Plural-Forms header is invalid ["+plural_forms+"]");}}else if(typeof(Gettext._locale_data[domain].head.plural_func)=='undefined'){Gettext._locale_data[domain].head.plural_func=function(n){var p=(n!=1)?1:0;return{'nplural':2,'plural':p};};}}
return;};Gettext.prototype.try_load_lang_po=function(uri){var data=this.sjax(uri);if(!data)return;var domain=this.uri_basename(uri);var parsed=this.parse_po(data);var rv={};if(parsed){if(!parsed[""])parsed[""]={};if(!parsed[""]["domain"])parsed[""]["domain"]=domain;domain=parsed[""]["domain"];rv[domain]=parsed;this.parse_locale_data(rv);}
return 1;};Gettext.prototype.uri_basename=function(uri){var rv;if(rv=uri.match(/^(.*\/)?(.*)/)){var ext_strip;if(ext_strip=rv[2].match(/^(.*)\..+$/))
return ext_strip[1];else
return rv[2];}else{return"";}};Gettext.prototype.parse_po=function(data){var rv={};var buffer={};var lastbuffer="";var errors=[];var lines=data.split("\n");for(var i=0;i<lines.length;i++){lines[i]=lines[i].replace(/(\n|\r)+$/,'');var match;if(/^$/.test(lines[i])){if(typeof(buffer['msgid'])!='undefined'){var msg_ctxt_id=(typeof(buffer['msgctxt'])!='undefined'&&buffer['msgctxt'].length)?buffer['msgctxt']+Gettext.context_glue+buffer['msgid']:buffer['msgid'];var msgid_plural=(typeof(buffer['msgid_plural'])!='undefined'&&buffer['msgid_plural'].length)?buffer['msgid_plural']:null;var trans=[];for(var str in buffer){var match;if(match=str.match(/^msgstr_(\d+)/))
trans[parseInt(match[1])]=buffer[str];}
trans.unshift(msgid_plural);if(trans.length>1)rv[msg_ctxt_id]=trans;buffer={};lastbuffer="";}}else if(/^#/.test(lines[i])){continue;}else if(match=lines[i].match(/^msgctxt\s+(.*)/)){lastbuffer='msgctxt';buffer[lastbuffer]=this.parse_po_dequote(match[1]);}else if(match=lines[i].match(/^msgid\s+(.*)/)){lastbuffer='msgid';buffer[lastbuffer]=this.parse_po_dequote(match[1]);}else if(match=lines[i].match(/^msgid_plural\s+(.*)/)){lastbuffer='msgid_plural';buffer[lastbuffer]=this.parse_po_dequote(match[1]);}else if(match=lines[i].match(/^msgstr\s+(.*)/)){lastbuffer='msgstr_0';buffer[lastbuffer]=this.parse_po_dequote(match[1]);}else if(match=lines[i].match(/^msgstr\[0\]\s+(.*)/)){lastbuffer='msgstr_0';buffer[lastbuffer]=this.parse_po_dequote(match[1]);}else if(match=lines[i].match(/^msgstr\[(\d+)\]\s+(.*)/)){lastbuffer='msgstr_'+match[1];buffer[lastbuffer]=this.parse_po_dequote(match[2]);}else if(/^"/.test(lines[i])){buffer[lastbuffer]+=this.parse_po_dequote(lines[i]);}else{errors.push("Strange line ["+i+"] : "+lines[i]);}}
if(typeof(buffer['msgid'])!='undefined'){var msg_ctxt_id=(typeof(buffer['msgctxt'])!='undefined'&&buffer['msgctxt'].length)?buffer['msgctxt']+Gettext.context_glue+buffer['msgid']:buffer['msgid'];var msgid_plural=(typeof(buffer['msgid_plural'])!='undefined'&&buffer['msgid_plural'].length)?buffer['msgid_plural']:null;var trans=[];for(var str in buffer){var match;if(match=str.match(/^msgstr_(\d+)/))
trans[parseInt(match[1])]=buffer[str];}
trans.unshift(msgid_plural);if(trans.length>1)rv[msg_ctxt_id]=trans;buffer={};lastbuffer="";}
if(rv[""]&&rv[""][1]){var cur={};var hlines=rv[""][1].split(/\\n/);for(var i=0;i<hlines.length;i++){if(!hlines.length)continue;var pos=hlines[i].indexOf(':',0);if(pos!=-1){var key=hlines[i].substring(0,pos);var val=hlines[i].substring(pos+1);var keylow=key.toLowerCase();if(cur[keylow]&&cur[keylow].length){errors.push("SKIPPING DUPLICATE HEADER LINE: "+hlines[i]);}else if(/#-#-#-#-#/.test(keylow)){errors.push("SKIPPING ERROR MARKER IN HEADER: "+hlines[i]);}else{val=val.replace(/^\s+/,'');cur[keylow]=val;}}else{errors.push("PROBLEM LINE IN HEADER: "+hlines[i]);cur[hlines[i]]='';}}
rv[""]=cur;}else{rv[""]={};}
return rv;};Gettext.prototype.parse_po_dequote=function(str){var match;if(match=str.match(/^"(.*)"/)){str=match[1];}
str=str.replace(/\\"/g,"\"");return str;};Gettext.prototype.try_load_lang_json=function(uri){var data=this.sjax(uri);if(!data)return;var rv=this.JSON(data);this.parse_locale_data(rv);return 1;};Gettext.prototype.get_lang_refs=function(){var langs=new Array();var links=document.getElementsByTagName("link");for(var i=0;i<links.length;i++){if(links[i].rel=='gettext'&&links[i].href){if(typeof(links[i].type)=='undefined'||links[i].type==''){if(/\.json$/i.test(links[i].href)){links[i].type='application/json';}else if(/\.js$/i.test(links[i].href)){links[i].type='application/json';}else if(/\.po$/i.test(links[i].href)){links[i].type='application/x-po';}else if(/\.mo$/i.test(links[i].href)){links[i].type='application/x-mo';}else{throw new Error("LINK tag with rel=gettext found, but the type and extension are unrecognized.");}}
links[i].type=links[i].type.toLowerCase();if(links[i].type=='application/json'){links[i].type='application/json';}else if(links[i].type=='text/javascript'){links[i].type='application/json';}else if(links[i].type=='application/x-po'){links[i].type='application/x-po';}else if(links[i].type=='application/x-mo'){links[i].type='application/x-mo';}else{throw new Error("LINK tag with rel=gettext found, but the type attribute ["+links[i].type+"] is unrecognized.");}
langs.push(links[i]);}}
return langs;};Gettext.prototype.textdomain=function(domain){if(domain&&domain.length)this.domain=domain;return this.domain;}
Gettext.prototype.gettext=function(msgid){var msgctxt;var msgid_plural;var n;var category;return this.dcnpgettext(null,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dgettext=function(domain,msgid){var msgctxt;var msgid_plural;var n;var category;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dcgettext=function(domain,msgid,category){var msgctxt;var msgid_plural;var n;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.ngettext=function(msgid,msgid_plural,n){var msgctxt;var category;return this.dcnpgettext(null,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dngettext=function(domain,msgid,msgid_plural,n){var msgctxt;var category;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dcngettext=function(domain,msgid,msgid_plural,n,category){var msgctxt;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category,category);};Gettext.prototype.pgettext=function(msgctxt,msgid){var msgid_plural;var n;var category;return this.dcnpgettext(null,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dpgettext=function(domain,msgctxt,msgid){var msgid_plural;var n;var category;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dcpgettext=function(domain,msgctxt,msgid,category){var msgid_plural;var n;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.npgettext=function(msgctxt,msgid,msgid_plural,n){var category;return this.dcnpgettext(null,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dnpgettext=function(domain,msgctxt,msgid,msgid_plural,n){var category;return this.dcnpgettext(domain,msgctxt,msgid,msgid_plural,n,category);};Gettext.prototype.dcnpgettext=function(domain,msgctxt,msgid,msgid_plural,n,category){if(!this.isValidObject(msgid))return'';var plural=this.isValidObject(msgid_plural);var msg_ctxt_id=this.isValidObject(msgctxt)?msgctxt+Gettext.context_glue+msgid:msgid;var domainname=this.isValidObject(domain)?domain:this.isValidObject(this.domain)?this.domain:'messages';var category_name='LC_MESSAGES';var category=5;var locale_data=new Array();if(typeof(Gettext._locale_data)!='undefined'&&this.isValidObject(Gettext._locale_data[domainname])){locale_data.push(Gettext._locale_data[domainname]);}else if(typeof(Gettext._locale_data)!='undefined'){for(var dom in Gettext._locale_data){locale_data.push(Gettext._locale_data[dom]);}}
var trans=[];var found=false;var domain_used;if(locale_data.length){for(var i=0;i<locale_data.length;i++){var locale=locale_data[i];if(this.isValidObject(locale.msgs[msg_ctxt_id])){for(var j=0;j<locale.msgs[msg_ctxt_id].length;j++){trans[j]=locale.msgs[msg_ctxt_id][j];}
trans.shift();domain_used=locale;found=true;if(trans.length>0&&trans[0].length!=0)
break;}}}
if(trans.length==0||trans[0].length==0){trans=[msgid,msgid_plural];}
var translation=trans[0];if(plural){var p;if(found&&this.isValidObject(domain_used.head.plural_func)){var rv=domain_used.head.plural_func(n);if(!rv.plural)rv.plural=0;if(!rv.nplural)rv.nplural=0;if(rv.nplural<=rv.plural)rv.plural=0;p=rv.plural;}else{p=(n!=1)?1:0;}
if(this.isValidObject(trans[p]))
translation=trans[p];}
return translation;};Gettext.strargs=function(str,args){if(null==args||'undefined'==typeof(args)){args=[];}else if(args.constructor!=Array){args=[args];}
var newstr="";while(true){var i=str.indexOf('%');var match_n;if(i==-1){newstr+=str;break;}
newstr+=str.substr(0,i);if(str.substr(i,2)=='%%'){newstr+='%';str=str.substr((i+2));}else if(match_n=str.substr(i).match(/^%(\d+)/)){var arg_n=parseInt(match_n[1]);var length_n=match_n[1].length;if(arg_n>0&&args[arg_n-1]!=null&&typeof(args[arg_n-1])!='undefined')
newstr+=args[arg_n-1];str=str.substr((i+1+length_n));}else{newstr+='%';str=str.substr((i+1));}}
return newstr;}
Gettext.prototype.strargs=function(str,args){return Gettext.strargs(str,args);}
Gettext.prototype.isArray=function(thisObject){return this.isValidObject(thisObject)&&thisObject.constructor==Array;};Gettext.prototype.isValidObject=function(thisObject){if(null==thisObject){return false;}else if('undefined'==typeof(thisObject)){return false;}else{return true;}};Gettext.prototype.sjax=function(uri){var xmlhttp;if(window.XMLHttpRequest){xmlhttp=new XMLHttpRequest();}else if(navigator.userAgent.toLowerCase().indexOf('msie 5')!=-1){xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}else{xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");}
if(!xmlhttp)
throw new Error("Your browser doesn't do Ajax. Unable to support external language files.");xmlhttp.open('GET',uri,false);try{xmlhttp.send(null);}
catch(e){return;}
var sjax_status=xmlhttp.status;if(sjax_status==200||sjax_status==0){return xmlhttp.responseText;}else{var error=xmlhttp.statusText+" (Error "+xmlhttp.status+")";if(xmlhttp.responseText.length){error+="\n"+xmlhttp.responseText;}
alert(error);return;}}
Gettext.prototype.JSON=function(data){return eval('('+data+')');}
/*

=head1 NOTES

These are some notes on the internals

=over

=item LOCALE CACHING

Loaded locale data is currently cached class-wide. This means that if two scripts are both using Gettext.js, and both share the same gettext domain, that domain will only be loaded once. This will allow you to grab a new object many times from different places, utilize the same domain, and share a single translation file. The downside is that a domain won't be RE-loaded if a new object is instantiated on a domain that had already been instantiated.

=back

=head1 BUGS / TODO

=over

=item error handling

Currently, there are several places that throw errors. In GNU Gettext, there are no fatal errors, which allows text to still be displayed regardless of how broken the environment becomes. We should evaluate and determine where we want to stand on that issue.

=item syncronous only support (no ajax support)

Currently, fetching language data is done purely syncronous, which means the page will halt while those files are fetched/loaded.

This is often what you want, as then following translation requests will actually be translated. However, if all your calls are done dynamically (ie. error handling only or something), loading in the background may be more adventagous.

It's still recommended to use the statically defined <script ...> method, which should have the same delay, but it will cache the result.

=item domain support

domain support while using shortcut methods like C<_('string')> or C<i18n('string')>.

Under normal apps, the domain is usually set globally to the app, and a single language file is used. Under javascript, you may have multiple libraries or applications needing translation support, but the namespace is essentially global.

It's recommended that your app initialize it's own shortcut with it's own domain.  (See examples/wrapper/i18n.js for an example.)

Basically, you'll want to accomplish something like this:

    // in some other .js file that needs i18n
    this.i18nObj = new i18n;
    this.i18n = this.i18nObj.init('domain');
    // do translation
    alert( this.i18n("string") );

If you use this raw Gettext object, then this is all handled for you, as you have your own object then, and will be calling C<myGettextObject.gettext('string')> and such.


=item encoding

May want to add encoding/reencoding stuff. See GNU iconv, or the perl module Locale::Recode from libintl-perl.

=back


=head1 COMPATABILITY

This has been tested on the following browsers. It may work on others, but these are all those to which I have access.

    FF1.5, FF2, FF3, IE6, IE7, Opera9, Opera10, Safari3.1, Chrome

    *FF = Firefox
    *IE = Internet Explorer


=head1 REQUIRES

bin/po2json requires perl, and the perl modules Locale::PO and JSON.

=head1 SEE ALSO

bin/po2json (included),
examples/normal/index.html,
examples/wrapper/i18n.html, examples/wrapper/i18n.js,
Locale::gettext_pp(3pm), POSIX(3pm), gettext(1), gettext(3)

=head1 AUTHOR

Copyright (C) 2008, Joshua I. Miller E<lt>unrtst@cpan.orgE<gt>, all rights reserved. See the source code for details.

=cut

*/;if(typeof sprintf!='function'){throw"locale_simple.js: require a javascript sprintf implementation";}
if(typeof Gettext!='function'||typeof Gettext.strargs!='function'){throw"locale_simple.js: require Gettext.js of http://jsgettext.berlios.de/ to be loaded, included in this distribution.";}
if(typeof locale_simple!='undefined'){throw"locale_simple.js: locale_simple.js already loaded";}
var locale_data={};var locale_simple={curr:null,lang:null,dir:null,dry:0,nowrite:0,tds:{},l_dir:function(dir){if(this.dir!=null){throw"locale_simple.js: can't switch dir";}
this.dir=dir;},l_dry:function(dry,nowrite){this.dry=dry;this.nowrite=nowrite;},l_lang:function(lang){if(this.lang!=null){throw"locale_simple.js: can't switch language";}
this.lang=lang;},ltd:function(textdomain){if(!(textdomain in this.tds)){this.tds[textdomain]=new Gettext({'domain':textdomain,'locale_data':locale_data});}
this.curr=this.tds[textdomain];return textdomain;},wd:function(td,msgctxt,msgid,msgid_plural){if(typeof console!='object'){return;}
if(typeof console.debug!='function'){return;}
if(td){console.debug('# domain: '+td)}
if(msgctxt){console.debug('msgctxt "'+msgctxt+'"')}
if(msgid){console.debug('msgid "'+msgid+'"')}
if(msgid_plural){console.debug('msgid_plural "'+msgid_plural+'"')}
console.debug('');},l:function(){var A=this.argarr(arguments);var id=A.shift();var gt;if(this.dry){gt=id;if(!this.nowrite){this.wd(null,null,id,null);}}else{gt=this.curr.gettext(id);}
A.unshift(gt);return sprintf.apply(null,A);},ln:function(){var A=this.argarr(arguments);var id=A.shift();var idp=A.shift();var n=A.shift();var gt;if(this.dry){if(n!=1){gt=idp;}else{gt=id;}
if(!this.nowrite){this.wd(null,null,id,idp);}}else{gt=this.curr.ngettext(id,idp,n);}
A.unshift(n);A.unshift(gt);return sprintf.apply(null,A);},lp:function(){var A=this.argarr(arguments);var ctxt=A.shift();var id=A.shift();var gt;if(this.dry){gt=id;if(!this.nowrite){this.wd(null,ctxt,id,null);}}else{gt=this.curr.pgettext(ctxt,id);}
A.unshift(gt);return sprintf.apply(null,A);},lnp:function(){var A=this.argarr(arguments);var ctxt=A.shift();var id=A.shift();var idp=A.shift();var n=A.shift();var gt;if(this.dry){if(n!=1){gt=idp;}else{gt=id;}
if(!this.nowrite){this.wd(null,ctxt,id,idp);}}else{gt=this.curr.npgettext(ctxt,id,idp,n);}
A.unshift(n);A.unshift(gt);return sprintf.apply(null,A);},ld:function(){var A=this.argarr(arguments);var td=A.shift();var id=A.shift();var gt;if(this.dry){gt=id;if(!this.nowrite){this.wd(td,null,id,null);}}else{gt=this.curr.dgettext(td,id);}
A.unshift(gt);return sprintf.apply(null,A);},ldn:function(){var A=this.argarr(arguments);var td=A.shift();var id=A.shift();var idp=A.shift();var n=A.shift();var gt;if(this.dry){if(n!=1){gt=idp;}else{gt=id;}
if(!this.nowrite){this.wd(td,null,id,idp);}}else{gt=this.curr.dngettext(td,id,idp,n);}
A.unshift(n);A.unshift(gt);return sprintf.apply(null,A);},ldp:function(){var A=this.argarr(arguments);var td=A.shift();var ctxt=A.shift();var id=A.shift();var gt;if(this.dry){gt=id;if(!this.nowrite){this.wd(td,ctxt,id,null);}}else{gt=this.curr.dpgettext(td,ctxt,id);}
A.unshift(gt);return sprintf.apply(null,A);},ldnp:function(){var A=this.argarr(arguments);var td=A.shift();var ctxt=A.shift();var id=A.shift();var idp=A.shift();var n=A.shift();var gt;if(this.dry){if(n!=1){gt=idp;}else{gt=id;}
if(!this.nowrite){this.wd(td,ctxt,id,idp);}}else{gt=this.curr.dnpgettext(td,ctxt,id,idp,n);}
A.unshift(n);A.unshift(gt);return sprintf.apply(null,A);},argarr:function(args){var arr=new Array();for(var i=0,len=args.length;i<len;i++){arr.push(args[i]);}
return arr;}};function l_dry(){return locale_simple.l_dry.apply(locale_simple,arguments)}
function l_dir(){return locale_simple.l_dir.apply(locale_simple,arguments)}
function l_lang(){return locale_simple.l_lang.apply(locale_simple,arguments)}
function ltd(){return locale_simple.ltd.apply(locale_simple,arguments)}
function l(){return locale_simple.l.apply(locale_simple,arguments)}
function ln(){return locale_simple.ln.apply(locale_simple,arguments)}
function lp(){return locale_simple.lp.apply(locale_simple,arguments)}
function lnp(){return locale_simple.lnp.apply(locale_simple,arguments)}
function ld(){return locale_simple.ld.apply(locale_simple,arguments)}
function ldn(){return locale_simple.ldn.apply(locale_simple,arguments)}
function ldp(){return locale_simple.ldp.apply(locale_simple,arguments)}
function ldnp(){return locale_simple.ldnp.apply(locale_simple,arguments)};locale_data['duckduckgo-duckduckgo']={"Embed Elsewhere:":[null,"Встроить где-нибудь еще:"],"":{"Plural-Forms":" nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2;","MIME-Version":" 1.0","POT-Creation-Date":" 2013-10-26 16:46-0500","Language":" Русский России (Russian of Russia)","Last-Translator":" Community","Content-Type":" text/plain; charset=UTF-8","Language-Team":" DuckDuckGo Community <community@duckduckgo.com>","PO-Revision-Date":" 2013-10-26 16:46-0500","Content-Transfer-Encoding":" 8bit","Project-Id-Version":" DuckDuckGo-Translation-0.000"},"Nearby":[null,"Поблизости"],"Your IP address is %s in %s":[null,"Ваш IP-адрес %s в %s"],"We believe in better search and real privacy at the same time. That's why:":[null,"Мы верим, что можно совместить точность поиска с подлинной конфиденциальностью. И вот почему:"],"cloudsave\u0004You can use Anonymous Cloud Save to store your settings in a more permanent way (on a remote server in the cloud).":[null,"Вы можете использовать Анонимное Сохранение в Облаке для сохранения Ваших настроек постоянно (на удалённом сервере в облаке)"],"random number":[null,"случайное число"],"Similar":[null,"Схожие"],"webelieve\u0004We":[null,"Мы"],"cloudsave\u0004You can share your settings among computers and browsers.":[null,"Вы можете переносить свои настройки между компьютерами и браузерами."],"our feedback center":[null,"наша служба обратной связи"],"Get results for different meanings of %s":[null,"Получить результаты для других значений %s"],"No right topic? Try web links...":[null,"Нет нужной темы? Проверьте веб-ссылки..."],"betterinstantanswers\u0004Better %s.":[null,"Лучшие %s"],"Meanings of %s":[null,"Значения %s"],"%d pg":["%d pgs","%d стр.","%d стр.","%d стр."],"Translate":[null,"Перевести"],"size\u0004Small":[null,"Малый"],"Cloud Save":[null,"Облачная Запись"],"Topics":[null,"Темы"],"Use %s command to turn off temporarily.":[null,"Используйте команду %s для временного отключения."],"Turn off":[null,"Выключить"],"About DuckDuckGo":[null,"Несколько слов о DuckDuckGo"],"Special":[null,"Специальный"],"cloudsave\u0004No personally identifiable information will be stored in the cloud, and your pass phrase will never leave your browser.":[null,"В Облаке не сохраняется идентифицирующая вас информация, и ваше ключевое слово никогда не покинет ваш браузер."],"within title":[null,"в названии"],"Look":[null,"Внешний вид"],"Computed by %s":[null,"Вычислено с помощью %s"],"Entry in %s":[null,"Статья в %s"],"cloudsave\u0004I forgot my passphrase. Can you recover it?":[null,"Я забыл свой уникальный пароль. Вы можете его восстановить?"],"See also":[null,"Смотрите также"],"We drop the clutter.":[null,"Мы уберём \"мусор\" с экрана "],"cloudsave\u0004We don't associate your IP address or browser fingerprint or any other information with the file.":[null,"Мы не призязываем Ваш IP адрес или отпечаток браузера или какую-либо другую информацию к этому файлу."],"supportus\u0004Support":[null,"Поддержка"],"If you want to use DuckDuckGo without JavaScript, please use our %s or %s versions.":[null,"Если Вы хотите использовать DuckDuckGo без JavaScript, то Вы можете воспользоваться %s или %s версией."],"Would you like to help develop the platform?":[null,"Хотите помочь в разработке платформы?"],"Bookmarklet and settings data":[null,"Данные букмарклетов и настроек"],"cloudsave\u0004Enable cloud save by enter your existing passphrase.":[null,"Включите облачное сохранение, введя уникальный пароль."],"Get updates on net privacy (rarely):":[null,"Получать информацию об изменениях правил в вопросах конфиденциальности вашей активности в Интернет (изредка): "],"newbang\u0004Site name":[null,"Название сайта"],"related topics":[null,"связанные темы"],"Results by %s":[null,"результаты от %s"],"Reset all settings to defaults":[null,"Вернуть стандартные настройки"],"Choose category":[null,"Выберите категорию"],"More about us...":[null,"Дополнительно о нас..."],"Source:":[null,"Источник:"],"Search DuckDuckGo":[null,"Поиск в DuckDuckGo"],"%s shipment tracking":[null,"Отслеживание доставки %s"],"Did you mean %s?":[null,"Возможно вы искали %s?"],"Show all":[null,"Показать все"],"cloudsave\u0004You can store several sets of settings for different purposes.":[null,"Вы можете сохранить несколько наборов настроек для различных целей."],"newbang\u0004If you'd like to add or edit a %s, please %s!":[null,"Если бы вы хотели добавить или править %s, то сначала %s!"],"hackus\u0004Hack":[null,"Разрабатывайте"],"optional":[null,"опционально"],"Light green":[null,"Светло-зелёный"],"cloudsave\u0004You can do this by saving your settings under a different passphrase, optionally deleting the first set.":[null,"Вы можете это сделать, сохранив Ваши настройки с другим паролем (и удалить первый набор, если Вы хотите)."],"setting\u0004Just hide legend":[null,"Просто прятать надпись."],"New Window:":[null,"Новое окно:"],"Muted red":[null,"Приглушённый красный"],"Load Cloud Settings":[null,"Загрузить настройки из Облака"],"syntax":[null,"синтаксис"],"Please choose a color:":[null,"Выберите цвет:"],"Email":[null,"Электронная почта"],"newbang\u0004Bang url":[null,"Ударная ссылка"],"setting\u0004Off":[null,"Отключить"],"Hide this legend?":[null,"Скрыть легенду?"],"See our %s":[null,"Смотрите наш %s"],"shortbelieve\u0004%s and %s.":[null,"%s и %s"],"of course":[null,"конечно"],"Search result title":[null,"Название поискового результата"],"Zero-click Info API":[null,"Информация о Zero-click API"],"Interface Settings":[null,"Настройки интерфейса"],"Do your part by helping five friends with %s.":[null,"Внесите свой вклад, избавив хотя бы пять человек от отслеживания с помощью %s."],"Like %s on Facebook":[null,"Лайкните %s на Facebook"],"wedontbubbleyou\u0004We don't %s you.":[null,"Мы не составляем %s из Ваших запросов."],"More meanings":[null,"Больше значений"],"setting\u0004default":[null,"по умолчанию"],"Region:":[null,"Регион:"],"%s is a parked domain (last time we checked).":[null,"%s это припаркованный домен (при последней проверке)."],"not %s encoding":[null,"не в кодировке %s"],"Sidebar:":[null,"Боковая панель:"],"Search suggestions":[null,"Предложения поиска"],"Share on %s":[null,"Делитесь на %s"],"Dropdown:":[null,"Ниспадающее меню:"],"domain search":[null,"поиск по домену"],"bangcat\u0004Entertainment":[null,"Развлечения"],"Have a question about DuckDuckGo?":[null,"У вас есть вопросы о DuckDuckGo?"],"searchbox\u0004DuckDuckGo is a search engine that protects privacy and has lots of features.":[null,"DuckDuckGo — поисковик, который защищает конфиденциальность и обладает массой достоинств."],"zci-product\u0004track":[null,"дорожка"],"Intense green":[null,"Насыщенный зелёный"],"Feedback / Question / Suggestion / Problem:":[null,"Обратная связь / Вопрос / Предложение / Проблема:"],"Text link:":[null,"Текст ссылки:"],"newbang\u0004Bang command":[null,"Прямая команда"],"A string to identify the source.":[null,"Строка для обозначения источника."],"cloudsave\u0004How do I change my passphrase?":[null,"Как я могу изменить мой уникальный пароль?"],"Safe search filtered 0-click info for %s":[null,"Безопасный поиск отфильтровал информацию о %s"],"Page #s:":[null,"Номера страниц:"],"Reviews":[null,"Обзоры"],"betterinstantanswers\u0004instant answers.":[null,"мгновенные ответы."],"Visited links:":[null,"Посещённые ссылки:"],"Bang category":[null,"Категория быстрого поиска"],"cloudsavepassphrase\u0004suggest":[null,"предложение"],"frontpage\u0004Find %s.":[null,"Находите %s."],"Load Settings":[null,"Загрузить настройки"],"Searches %s using our %s":[null,"Поиск в %s используя наш %s"],"The following required fields were not filled:":[null,"Эти обязательные поля не были заполнены:"],"Looking for recent announcements?":[null,"Хотите увидеть свежие анонсы?"],"Friends don't let friends get tracked.":[null,"Друзья не позволят слежку за своими друзьями"],"Embeds:":[null,"Встраивает:"],"wedonttrackyou\u0004track":[null,"отслеживаем"],"cloudsave\u0004Cloud Save":[null,"Облачная Запись"],"go":[null,"перейти"],"Alphabetically":[null,"В алфавитном порядке"],"More":[null,"Еще"],"Header:":[null,"Заголовок:"],"Get the DuckDuckGo newsletter (monthly).":[null,"Получить ежемесячные новости от DuckDuckGo."],"cloudsave\u0004Enter a new passphrase and click \"%s\". This will save your data under your new passphrase.":[null,"Введите новый уникальный пароль и нажмите \"%s\". Это сохранит ваши данные под вашим новым паролем."],"there was an error.":[null,"произошла ошибка."],"Privacy":[null,"Конфиденциальность"],"cloudsave\u0004In the browser, we then select four or five random words from that list, ensuring that it is at least 18-20 characters long.":[null,"Затем мы выбираем в браузере четыре или пять случайных слов из списка, убедившись, что они содержат как минимум 18-20 символов."],"vehicle info":[null,"информация о транспорте"],"Mark where the search goes with {{{s}}}":[null,"Отметьме при помощи {{{s}}}, где сам поиск."],"We'd also love to know how you heard about us.":[null,"Мы также хотели бы знать, откуда вы услышали о нас?"],"supportus\u0004%s us.":[null,"%s нас."],"cloudsave\u0004Push \"%s\". This removes the data from the cloud, but it remains in your browser until you click on \"%s\".":[null,"\tНажмите \"%s\". Это удалит Ваши данные из облака, но они останутся в Вашем браузере, пока Вы не клинете \"%s\"."],"Highlight:":[null,"Выделение:"],"Chat":[null,"Чат"],"Sorry, we can't offer any translation for this page. It is shown here in '%s'.":[null,"К сожалению, у нас нет никакого перевода этой страницы. Здесь она отображена на '%s'. "],"Want to develop an instant answer?":[null,"Хотите ответить на этот вопрос сейчас?"],"DuckDuckGo URL Parameters":[null,"Параметры URL для DuckDuckGo"],"map":[null,"карта"],"More explanation":[null,"Ещё толкования"],"%s is a zip code in %s":[null,"%s - почтовый индекс в %s"],"No video playback capabilities":[null,"Невозможно воспроизвести видео"],"click here":[null,"Нажмите здесь."],"Border:":[null,"Рамка:"],"Offers":[null,"Предложения"],"Is someone working on your zero-click plugin?":[null,"Кто-то уже работает над вашим zero-click плагин? "],"next result":[null,"следующий результат"],"Links:":[null,"Ссылки:"],"Get the non-JS version %s":[null,"Перейти к версии %s без JS"],"cloudsave\u0004It is easier to remember four or five words than 10 random letters and numbers, and far more secure.":[null,"Легче запомнить 4-5 слов, нежели чем 10 произвольных букв и цифр, и куда безопаснее."],"DuckDuckGo Support Center":[null,"Центр поддержки DuckDuckGo"],"cloudsave\u0004Cloud Save FAQ":[null,"ЧАВО по Облачной Записи"],"questions\u0004If you have any questions or concerns, please %s.":[null,"Если у вас возникли какие-либо вопросы или проблемы, пожалуйста, %s"],"Some meanings":[null,"Некоторые значения"],"Official site":[null,"Официальный сайт"],"cloudsave\u0004The cloud save bookmarklet is a URL that automatically enables cloud save.":[null,"Букмарклет для сохранения в облаке - URL, который автоматически включает сохранение в облаке."],"Feedback:":[null,"Обратная связь:"],"0-click box:":[null,"Поле ввода \"Ноль кликов\":"],"pages":[null,"страницы"],"Try: %s":[null,"Попробуйте: %s"],"Light blue":[null,"Светло-синий"],"Go":[null,"Вперёд!"],"All Rights Reserved.":[null,"Все права защищены."],"Help spread DuckDuckGo (rare emails, <1/mo).":[null,"Помогите распространить DuckDuckGo (редко, возможно 1 раз в месяц или реже)"],"DuckDuckGo Feedback":[null,"Служба поддержки DuckDuckGo"],"cloudsave\u0004Your passphrase is used to generate a key using the Secure Hash Algorithm known as %s, using a %s bit key.":[null,"Ваш пароль используется для образования ключа, при помощи алгоритма Secure Hash, известного как %s, используя ключ в %s бит."],"Save Settings":[null,"Сохранить настройки"],"placement\u0004Left":[null,"Слева"],"Try %s":[null,"Попробуйте %s"],"Auto-load:":[null,"Авто-загрузка:"],"donttrackus\u0004track":[null,"следим"],"Interface":[null,"Интерфейс"],"moreinfo\u0004this help page":[null,"это страница помощи "],"Meanings (disambig):":[null,"Другие значения:"],"%s grouped into sections":[null," %s, объединенный в секции"],"wedonttrackyou\u0004We don't %s you.":[null,"Мы не %s вас."],"bubble":[null,"пузырь"],"Feel free to adjust the settings below. Then, just copy and paste the code into your website!":[null,"Вы можете изменить настройки ниже. Затем, просто скопируйте и вставьте код в Ваш сайт!"],"Search domain %s":[null,"Поиск по домену %s"],"cloudsave\u0004You can restore your settings after deleting cookies":[null,"Вы можете восстановить свои настройки после удаления cookies."],"Most big sites work, e.g. %s (see full list below)":[null,"Большинство крупных сайтов работают, например %s (смотрите полный список снизу)."],"Placement:":[null,"Расположение: "],"Redirect:":[null,"Перенаправление:"],"DuckDuckGo Bot":[null,"Бот DuckDuckGo"],"Bang url, e.g. %s":[null,"Ссылка быстрого поиска"],"useus\u0004Use":[null,"Использование"],"Listen":[null,"Слушать"],"Link font:":[null,"Шрифт ссылки:"],"Did you mean":[null,"Возможно, вы имели в виду"],"Warning! Site could be harmful.":[null,"Внимание! Сайт может нанести вред."],"Are you looking for our advanced syntax?":[null,"Ищете наш расширенный синтаксис?"],"Orange":[null,"Оранжевый"],"frontpage\u0004Search %s.":[null,"Ищите %s."],"Want to share a suggestion with other users?":[null,"Хотите отправить предложение другим пользователям?"],"by %s":[null,"от %s"],"cloudsave\u0004No. Unless you deleted your settings, the settings file will still be there but we have no way of associating it with you.":[null,"Нет. Пока вы не удалили свои настройки, файл с ними будет оставаться здесь, но он не будет ассоциирован с вами."],"Width:":[null,"Ширина:"],"Most generic keywords work too, e.g. %s":[null,"Более общие ключевые слова тоже работают, например, %s"],"Bang command, e.g. %s (usually is domain name, e.g. %s)":[null,"Команда быстрого поиска, например %s (как правило - доменное имя сайта, %)"],"DuckDuckGo New !Bang":[null,"Новый !Bang DuckDuckGo"],"Shortcuts":[null,"Сокращения"],"size\u0004Larger":[null,"Больше"],"Search ideas":[null,"Идеи для поиска"],"More Related Topics":[null,"Больше связанных материалов"],"cloudsave\u0004Enable cloud save by entering your existing passphrase.":[null,"Позволить сохранение в облаке при введении вашего пароля"],"Underline:":[null,"Подчёркивание: "],"share this":[null,"поделиться этим"],"Try search on":[null,"Искать в"],"or write out the font you want":[null,"или укажите шрифт, который Вам нравится"],"%s for %s":[null,"%s для %s"],"Submit":[null,"Подтвердить"],"Whoops! The feedback form is empty!":[null,"Упс! Форма обратной связи не заполнена! "],"snippet text":[null,"фрагмент текста"],"Contact Us":[null,"Свяжитесь с нами"],"Monthly newsletter:":[null,"Ежемесячные новостные рассылки: "],"Your settings as a URL parameter bookmarklet:":[null,"Ваши настройки как URL с параметрами:"],"cloudsave\u0004Save your settings anonymously in the cloud!":[null,"Сохраните анонимно ваши настройки в облаке!"],"Privacy Settings":[null,"Настройки приватности"],"Curious about the company?":[null,"Хотите знать больше о нас?"],"Address bar:":[null,"Адресная строка:"],"Get the non-JS version":[null,"Перейти к версии без JavaScript"],"nonjsversion\u0004here":[null,"здесь"],"setting\u0004Show full legend":[null,"Показать полную легенду"],"Try DuckDuckGo for a week!":[null,"Попробуйте использовать DuckDuckGo в течение одной недели!"],"twitter\u0004Follow %s":[null,"Читать %s"],"This page requires %s":[null,"Эта страница требует %s"],"To introduce people to DuckDuckGo, you can use:":[null,"Помогая людям использовать DuckDuckGo, вы можете: "],"Text:":[null,"Текст:"],"New %s suggestions?":[null,"Новые предложения %s?"],"Technical":[null,"Технически"],"width\u0004Normal":[null,"Обычный"],"What does this mean?":[null,"Что это значит?"],"Result Settings":[null,"Настройка результатов"],"White":[null,"Белый"],"permanently":[null,"постоянно"],"%d disc":["%d discs","%d диск","%d диска","%d дисков"],"%s is an area code in %s":[null,"%s является кодом региона в %s "],"size\u0004Largest":[null,"Наибольший"],"We call these commands %s, and this syntax works for 100s of sites:":[null,"Мы называем эти команды %s, и этот синтаксис работает для сотен сайтов:"],"questions\u0004let us know":[null,"дайте нам знать"],"cloudsave\u0004We do not have usernames and we don't store any personally identifiable information.":[null,"У нас нет ваших логинов и мы не храним никакой персональной идентифицирующей информации. "],"newbang\u0004here":[null,"здесь"],"privacy policy":[null,"Политика конфиденциальности"],"frontpage\u0004anonymously":[null,"анонимно"],"Help":[null,"Помощь"],"Just use this dropdown next to the search box. As you use it, your most frequented sites will automatically be displayed at the top.":[null,"Просто пользуйтесь этим выпадающим списком после поисковой строки. По мере Вашего использования, Ваши более часто используемые сайты будут автоматически отображаться наверху."],"Color Settings":[null,"Настройки цветовой схемы"],"Choose Subcategory":[null,"Выберите подкатегорию"],"cloudsave\u0004DuckDuckGo does not ever know your passphrase.":[null,"DuckDuckGo даже понятия не имеет, какой у вас пароль."],"webelieve\u0004We believe in %s and %s at the same time.":[null,"Мы верим, что можно совместить %s и %s."],"Email:":[null,"Электронная почта:"],"bangcat\u0004Tech":[null,"Технология"],"Set as Homepage":[null,"Сделать стартовой страницей"],"News":[null,"Новости"],"Feel free to adjust the settings below. Then, just copy and paste the code into your website.":[null,"Свободно меняйте настройки ниже. Затем просто скопируйте и вставьте код на Вашу веб-страничку."],"Show pass phrase":[null,"Показать ключевую фразу"],"cloudsave\u0004Only the settings that you have changed. They are detailed on the %s page.":[null,"Только изменённые Вами настройки. Они перечислены на странице %s."],"tonsgoodies\u0004tons of goodies":[null,"куча вкусностей"],"DuckDuckGo Goodies":[null,"Вкусности DuckDuckGo"],"built with %s":[null,"создан с помощью %s"],"Top %d Best Websites of %d.":[null,"TOP-%d лучших вебсайтов из %d"],"Or try %s":[null,"Или попробуйте %s"],"Look & Feel Settings":[null,"Визуальные настройки"],"Twitter:":[null,"Twitter:"],"URLs:":[null,"URL-ы:"],"bangcat\u0004Shopping":[null,"Покупки"],"Direct link to your settings in the cloud":[null,"Прямая ссылка на ваши настройки в облаке"],"Distinguishes itself with a %s policy":[null,"отличается курсом на %s"],"translateus\u0004%s us.":[null,"%s нас."],"search amazon":[null,"искать на amazon"],"random password":[null,"случайный пароль"],"Team Duck":[null,"Команда сайта"],"Yes":[null,"Да"],"Help Spread DuckDuckGo!":[null,"Помогите людям узнать о DuckDuckGo!"],"Newbang\u0004Bang url":[null,"Прямой УРЛ"],"setting\u0004On & floating":[null,"есть, плавающее"],"(see the %s page for detailed descriptions)":[null,"(смотрите %s страницу для полного описания)"],"%s is a phone number in %s":[null,"%s это телефонный номер в %s"],"Economy and Finance":[null,"Экономика и Финансы"],"setting\u0004On but no numbers":[null,"есть, но без цифр"],"cloudsave\u0004Is deleted data really deleted?":[null,"Удалены ли данные на самом деле?"],"cloudsave\u0004We save the settings file on Amazon S3 using the generated key as the name.":[null,"Мы сохраняем файл с настройками на Amazon S3, используя созданный ключ как имя."],"Grey":[null,"Серый"],"Preview":[null,"Предпросмотр"],"More results":[null,"Больше результатов"],"HTTPS:":[null,"HTTPS:"],"Related topics":[null,"Связанные темы"],"You can change %s via URL parameters by adding them after the search query, for example:":[null,"Вы можете менять %s посредством параметров URL, добавляя их после поискового запроса, например:"],"setting\u0004On & scrolling":[null,"есть, скроллирующееся"],"Add to Browser":[null,"Добавить в браузер"],"Load/Reset":[null,"Загрузить/Сбросить"],"DuckDuckGo has better instant answers, less spam and clutter, and real privacy.":[null,"DuckDuckGo предлагает более качественные мгновенные ответы без спама и помех плюс настоящую конфиденциальность."],"Follow %s on Twitter":[null,"Следите за %s в Twitter"],"Doodles? Yes, %s!":[null,"Каракули? Да, %s!"],"size\u0004Large":[null,"крупный "],"No results.":[null,"Нет результатов."],"Site has good reputation.":[null,"У сайта хорошая репутация"],"Disable":[null,"Выключить"],"Your IP address is %s":[null,"Ваш IP-адрес %s"],"Partner? %s.":[null,"Партнер? %s."],"This page requires Javascript to function.":[null,"Для нормальной работы данной странице необходима поддержка JavaScript."],"first result":[null,"первый результат"],"Pink":[null,"Розовый"],"album":[null,"альбом"],"Press? %s.":[null,"Пресса? %s"],"oneofmanyspread\u0004support DuckDuckGo":[null,"поддержать DuckDuckGo"],"cloudsave\u0004Cloud Save lets you save your settings more permanently by entering a passphrase. It is entirely optional.":[null,"Облачная Запись предоставляет долговременное хранение и защиту ваших настроек,методом ввода секретной фразы.Это необязательная функция."],"search too long":[null,"слишком длинный поиск"],"%s will run a search with safe search off.":[null,"%s будет искать с выключенным режимом \"Безопасный поиск\"."],"Feedback":[null,"Обратная связь"],"What is this?":[null,"Что это такое?"],"PRIVACY":[null,"КОНФИДЕНЦИАЛЬНОСТЬ"],"main results":[null,"основные результаты"],"pay":[null,"платный"],"sort by date":[null,"сортировать по дате"],"Care to help translate DuckDuckGo into your language?":[null,"Желаете помочь перевести DuckDuckGo на ваш язык?"],"Library":[null,"Библиотека"],"find files":[null,"найти файлы"],"Get Web links":[null,"Получить ссылки"],"Favicons:":[null,"Иконки:"],"Safe Search:":[null,"Безопасный поиск:"],"wedontbubbleyou\u0004filter bubble":[null,"«поисковый пузырь»"],"width\u0004Wide":[null,"Широкий"],"within body":[null,"в теле"],"Black":[null,"Черный"],"oneofmanyspread\u0004spread DuckDuckGo":[null,"рассказать о DuckDuckGo"],"cloudsave\u0004Even if you could do that, there is no point since all the information is there in the open, unencrypted, provided you know the key.":[null,"Даже если Вы могли бы это сделать, не несёт смысла, поскольку вся информация есть уже в открытом доступе, расшифроманная, только если Вы знаете ключ."],"Your browser cookies:":[null,"Cookies вашего браузера:"],"Intense red":[null,"Насыщенный красный"],"Perhaps you've heard about us in %s":[null,"Может быть, Вы о нас слышали на %s"],"GET INVOLVED":[null,"ПРИСОЕДИНЯЙТЕСЬ"],"%s is in %s":[null,"%s находится в %s"],"Ads via %s":[null,"Реклама от %s"],"cloudsave\u0004The benefit of this over using the URL parameters bookmarklet is that when you change settings, they will automatically be saved in the cloud.":[null,"Преимущество этого по сравнению с использованием параметров в URL в том, что когда Вы меняете настройки, они автоматически сохраняются в облаке."],"Community Platform":[null,"Платформа Сообщества"],"URL Parameters":[null,"Параметры URL"],"By category":[null,"По категории"],"shortbelieve\u0004no tracking":[null,"отсутствие отслеживания"],"Enter your pass phrase to load your settings from the cloud.":[null,"Введите пароль для загрузки ваших настроек из облака."],"Results":[null,"Результаты"],"duckco\u0004%s Forum":[null,"Форум %s"],"DuckDuckGo settings":[null,"Настройки DuckDuckGo"],"newbang\u0004Submit them %s.":[null,"Предложите их %s"],"cloudsave\u0004In the interest of transparency, this data is not encrypted: you can see exactly what information we store.":[null,"В интересах прозрачности эти данные не зашифрованы: Вы можете видеть точно, какую именно информацию мы храним. "],"frontpage\u0004instantly":[null,"мгновенно"],"Plugin suggestions?":[null,"Хотите предложить плагин?"],"cloudsave\u0004How is it anonymous?":[null,"Насколько это анонимно?"],"hackus\u0004%s us.":[null,"%s нас."],"no search":[null,"нет поиска"],"put search terms here":[null,"укажите поисковый запрос здесь"],"COMMUNITY":[null,"СООБЩЕСТВО"],"we have those, too":[null,"они у нас тоже есть"],"setting\u0004a particular username, e.g. %s":[null,"Какой нибудь пользователь, вроде %s"],"turn off region":[null,"убрать регион"],"random":[null,"случайный"],"Safe search is on. No safe search results.":[null,"Безопасный поиск включен. Результаты не найдены."],"duckduckbot\u0004DuckDuckBot is the Web crawler for %s. It respects %s and originates from these IP addresses:":[null,"DuckDuckBot - это поисковой робот %s. Он уважает %s и работает с этих IP адресов: "],"schwag":[null,"коммерчески продвигаемый"],"Or you can type in a command like '%s bags', which will take you to %s and auto-search it for 'bags'.":[null,"Или Вы можете написать команду, например '%s сумки', которая перенаправит Вас на %s и сама запустит в нём поиск \"сумки\"."],"useus\u0004%s us.":[null,"%s нас."],"newbang\u0004submit it here":[null,"пришлите его сюда"],"Site name, e.g. %s or %s":[null,"Имя сайта, например %s или %s"],"shortbelieve\u0004Goodies":[null,"Вкусности"],"Want to integrate DuckDuckGo with your browser?":[null,"Хотите интегрировать DuckDuckGo с вашим браузером?"],"tonsgoodies\u0004We have %s.":[null,"У нас есть %s"],"Safe search filtered your search to %s":[null,"Безопасный поиск отфильтровал Ваш поисковый запрос по %s"],"cloudsave\u0004Cloud Save discussion on %s":[null,"Обсуждение Облачной Записи на %s"],"Goodies":[null,"Полезности"],"All Settings":[null,"Все настройки"],"new tab":[null,"новая вкладка"],"setting\u0004Off & centered":[null,"нет, посередине"],"If you do too, the best help is to set up your friends and family with DuckDuckGo for a week:":[null,"Вы тоже можете помочь, предложив друзьям и родственникам попробовать DuckDuckGo хотя бы неделю:"],"Developer? Check out %s.":[null,"Разработчик? Смотрите %s."],"cloudsave\u0004What is the cloud save bookmarklet and how does it differ from the URL parameter bookmarklet?":[null,"Что такое букмарклет для сохранения облака и как он отличается от букмарклета с параметрами URL?"],"setting\u0004Just hide \"%s\"":[null,"Спрятать \"%s\""],"Subcategory":[null,"Подкатегория"],"About":[null,"О сайте"],"temporarily":[null,"временно"],"Press":[null,"Отзывы"],"Supporter? %s.":[null,"Помощник? %s."],"width\u0004Super wide":[null,"Сверхширокий"],"Search Box":[null,"Строка поиска"],"We do not track or bubble you!":[null,"Мы не отслеживаем вас, так же как и не составляем поисковый пузырь из ваших запросов!"],"DuckDuckGo Help":[null,"Справка DuckDuckGo"],"DuckDuckGo Instant Answer API":[null,"API Мгновенных Ответов DuckDuckGo"],"webelieve\u0004real privacy":[null,"настоящую конфиденциальность"],"Subject:":[null,"Тема:"],"No correct topic? Try web links...":[null,"Не найдена подходящая тема? Попробуйте ссылки... "],"Help Pages":[null,"Страницы Помощи"],"webelieve\u0004no tracking":[null,"без слежки"],"Add a %s search box to your site!":[null,"Добавьте поиск от %s на ваш сайт!"],"Your settings in %s format:":[null,"Ваши настройки в формате %s:"],"See Also":[null,"См. также"],"cloudsave\u0004Your passphrase never leaves the browser, only the key and the settings file associated with it.":[null,"Ваш пароль никуда не передается, мы храним только ключ и файл с настройками."],"Purple":[null,"Фиолетовый"],"Other uses":[null,"Другие варианты"],"bangcat\u0004Research":[null,"Исследование"],"Meanings":[null,"Значения"],"Top links:":[null,"Популярные ссылки:"],"Ignore this box please":[null,"Пожалуйста, игнорируйте это поле"],"Pass phrase strength":[null,"Устойчивость уникального пароля"],"Yellow":[null,"Жёлтый"],"bangcat\u0004Online Services":[null,"Онлайн услуги"],"Dictionary":[null,"Словарь"],"uk region":[null,"регион - Великобритания"],"Support":[null,"Поддержка"],"setting\u0004On":[null,"есть"],"Images":[null,"Изображения"],"By default, your settings are stored in non-personal browser cookies (in your browser).":[null,"По умолчанию ваши настройки хранятся в непривязанных к личным данным куках (в вашем браузере)"],"DuckDuckGo Privacy":[null,"Приватность DuckDuckGo"],"shipment tracking":[null,"отслеживание доставки"],"Privacy Policy":[null,"Политика конфиденциальности"],"I'm feeling ducky":[null,"Мне повезет"],"Blue":[null,"Голубой"],"Forum":[null,"Форум"],"Web links":[null,"Ссылки"],"More related topics":[null,"Больше связанных тем"],"Add to %s":[null,"Добавить в %s"],"We don't %s or %s you!":[null,"Мы не %s или %s Вас!"],"disambiguation":[null,"устранение конфликтов"],"cloudsave\u0004Each time you ask for a passphrase suggestion, we get a reasonably large list of random words from the DuckDuckGo servers.":[null,"Каждый раз, когда вы просите нас порекомендовать пароль, мы запрашиваем с серверов DuckDuckGo достаточно большой список случайных слов."],"Background:":[null,"Фон:"],"cloudsave\u0004How does it work?":[null,"Как это работает?"],"hide this FAQ":[null,"скрыть ЧАВО"],"Your settings as a cloud save bookmarklet:":[null,"Ваши настройки как букмарклет для сохранения в облаке:"],"Green":[null,"Зелёный"],"dropdown":[null,"выпадающий список"],"Instant Answer API":[null,"API Мгновенных Ответов"],"DuckDuckGo enables you to search 100s of other sites directly.":[null,"DuckDuckGo позволяет Вам напрямую искать сотни других сайтов."],"Map":[null,"Карта"],"%s at %s":[null,"%s на %s"],"newbang\u0004New %s":[null,"Новые %s"],"cloudsave\u0004How does passphrase generation work?":[null,"Как работает генератор паролей?"],"Settings":[null,"Настройки"],"Sort by date":[null,"Сортировать по дате"],"Regular search box":[null,"Обыкновенная поисковая строка"],"More links":[null,"Больше ссылок"],"Shortcuts:":[null,"Сочетания клавиш:"],"placement\u0004Middle":[null,"По центру"],"prev result":[null,"предыдущий результат"],"size\u0004Medium":[null,"Средний"],"Searching for info on our XMPP chat service?":[null,"Ищете информацию на нашем XMPP чат-сервисе?"],"More Links":[null,"Ещё ссылки"],"cloudsave\u0004What information gets saved?":[null,"Какая информация сохраняется?"],"Off-white":[null,"Нет, белый"],"'%s' or '%s' or '%s' will take you to the first result.":[null,"'%s' или'%s', а также '%s' вернут Вас к первому результату."],"Keyboard shortcuts":[null,"Горячие клавиши"],"Policy":[null,"Политика"],"oneofmanyspread\u0004One of many ways to help %s":[null,"Один из многих способов помощи в %s"],"cloudsave\u0004This has a few benefits:":[null,"Это имеет несколько преимуществ:"],"Category":[null,"Категория"],"Reverse search":[null,"Обратный поиск"],"Choose Category":[null,"Выберите категорию"],"Platform":[null,"Платформа"],"Choose subcategory":[null,"Выберите подкатегорию"],"or write out the color code you want, e.g. %s (%s is an encoded %s char).":[null,"или укажите, какой Вам хочется цвет, например %s (%s - зашифрованный символ %s)."],"Some topics grouped into %s":[null," Некоторые темы сгруппированы в %s"],"Delete my data":[null,"Удалить мои данные"],"bangcat\u0004News":[null,"Новости"],"More at %s":[null,"Подробнее на %s"],"Advertisements:":[null,"Рекламные объявления:"],"cloudsave\u0004We cannot reverse the passphrase key generation.":[null,"Мы не можем давать обратный ход процессу образования ключа для пароля."],"Our favorite alternative search engine, DuckDuckGo":[null,"Наша любимая альтернативная поисковая система, DuckDuckGo"],"More topics":[null,"Больше тем"],"Tan":[null,"Желто-коричневый"],"Spread":[null,"Распространять"],"Show details of your settings including bookmarklet":[null,"Показать подробности Ваших настроек, включая букмарклет"],"There are also shorter versions, e.g. %s":[null,"Есть более короткие версии, например %s"],"DDG Topics List":[null,"DDG Список Тем"],"and %s":[null,"и %s"],"uses results from %s":[null,"использованы результаты %s"],"Support Us":[null,"Поддержите нас"],"webelieve\u0004better search":[null,"точный поиск"],"setting\u0004username":[null,"имя пользователя"],"Colors":[null,"Цвета"],"Internet privacy updates (not just about us).":[null,"Новости глобальной конфиденциальности в Интернете."],"We believe you can get better search AND real privacy at the same time. That's why:":[null,"Мы верим в то, что вы можете пользоваться точным поиском, ПРИ ЭТОМ сохраняя подлинную конфиденциальность. Поэтому: "],"link to the site":[null,"ссылка на сайт"],"%s is a %s":[null,"%s это %s"],"Sponsored link":[null,"Ссылка спонсора"],"Comments":[null,"Комментарии"],"Red":[null,"Красный"],"Give feedback":[null,"Оставить отзыв"],"Less spam and clutter.":[null,"Меньше спама и суматохи."],"translateus\u0004Translate":[null,"Перевести"],"email address":[null,"адрес эл.почты"],"Finally, friends don't let friends get tracked!":[null," И, наконец, друзья не позволяют, чтобы за их друзьями следили! "],"Hide feedback icon?":[null,"Скрыть иконку обратной связи?"],"Help? Check out %s.":[null," Нужна помощь? Зайдите на %s"],"from %s":[null,"от %s"],"cloudsave\u0004Passphrases cannot feasibly be reverse engineered from a key":[null,"Пароль никак нельзя восстановить по ключу"],"Size:":[null,"Размер:"],"Top":[null,"Вверх"],"bangcat\u0004Multimedia":[null,"Мультимедиа"],"Develop":[null,"Разрабатывайте"],"webelieve\u0004%s believe in %s and %s.":[null,"%s верим в %s, %s."],"Please try again":[null,"Пожалуйста, попробуйте снова"],"DuckDuckGo Search Box":[null,"Панель поиска DuckDuckGo"],"Search syntax":[null,"Поисковый синтаксис"],"a pure search engine %s and its use is soaring":[null,"поисковик в чистом виде %s, и им пользуются все чаще"],"Help test new features (rare emails, <1/mo).":[null,"Помогите нам протестировать новые функции через письма на вашу электронную почту (редко, возможно 1 раз в месяц или реже)"],"URL Params":[null,"Параметры URL"],"Text font:":[null,"Шрифт текста:"],"DuckDuckGo Zero-click Info API":[null,"Информация о Zero-click DuckDuckGo API"],"Add-ons":[null,"Дополнения"],"setting\u0004On but don't save":[null,"Включить, но не сохранять"],"moreinfo\u0004See %s for more info.":[null,"Смотрите %s для дополнительной информации."],"DuckDuckGo Settings":[null,"Настройки DuckDuckGo"],"Could DuckDuckGo Be The Biggest Long-Term Threat To Google?":[null,"Может ли DuckDuckGo Быть Самой Большой и Страшной Угрозой Гуглу?"],"Try to go there":[null,"Попробуйте перейти туда"],"book":[null,"книга"],"Swag? %s.":[null,"Сувениры? %s."]};ltd('duckduckgo-duckduckgo');