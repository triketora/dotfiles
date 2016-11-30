<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: flymake-cursor.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=flymake-cursor.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: flymake-cursor.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=flymake-cursor.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for flymake-cursor.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=flymake-cursor.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Oman, National Day, Latvia, Proclamation of Independence</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22flymake-cursor.el%22">flymake-cursor.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/flymake-cursor.el">Download</a></p><pre class="code"><span class="linecomment">;;; flymake-cursor.el --- displays flymake error msg in minibuffer after delay</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Author     : ??</span>
<span class="linecomment">;; origin     : http://paste.lisp.org/display/60617,1/raw</span>
<span class="linecomment">;; Maintainer : Dino Chiesa &lt;dpchiesa@hotmail.com&gt;</span>
<span class="linecomment">;; Created    : May 2011</span>
<span class="linecomment">;; Modified   : May 2011</span>
<span class="linecomment">;; Version    : 0.1.1</span>
<span class="linecomment">;; Keywords   : languages mode flymake</span>
<span class="linecomment">;; X-URL      : http://www.emacswiki.org/emacs/flymake-cursor.el</span>
<span class="linecomment">;; Last-saved : &lt;2011-May-09 16:35:59&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; -------------------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; License: None.  This code is in the Public Domain.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Additional functionality that makes flymake error messages appear</span>
<span class="linecomment">;; in the minibuffer when point is on a line containing a flymake</span>
<span class="linecomment">;; error. This saves having to mouse over the error, which is a</span>
<span class="linecomment">;; keyboard user's annoyance.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; -------------------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This flymake-cursor module displays the flymake error in the</span>
<span class="linecomment">;; minibuffer, after a short delay.  It is based on code I found roaming</span>
<span class="linecomment">;; around on the net, unsigned and unattributed. I suppose it's public</span>
<span class="linecomment">;; domain, because, while there is a "License" listed in it, there</span>
<span class="linecomment">;; is no license holder, no one to own the license.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This version is modified slightly from that code. The post-command fn</span>
<span class="linecomment">;; defined in this code does not display the message directly. Instead</span>
<span class="linecomment">;; it sets a timer, and when the timer fires, the timer event function</span>
<span class="linecomment">;; displays the message.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The reason to do this: the error message is displayed only if the</span>
<span class="linecomment">;; user doesn't do anything, for about one second. This way, if the user</span>
<span class="linecomment">;; scrolls through a buffer and there are myriad errors, the minibuffer</span>
<span class="linecomment">;; is not constantly being updated.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If the user moves away from the line with the flymake error message</span>
<span class="linecomment">;; before the timer expires, then no error is displayed in the minibuffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; I've also updated the names of the defuns. They all start with flyc now.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To use this, include this line in your .emacs:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    ;; enhancements for displaying flymake errors</span>
<span class="linecomment">;;    (require 'flymake-cursor)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can, of course, put that in an eval-after-load clause.</span>
<span class="linecomment">;;</span>

(require 'cl)

(defvar flyc--e-at-point nil
  "<span class="quote">Error at point, after last command</span>")

(defvar flyc--e-display-timer nil
  "<span class="quote">A timer; when it fires, it displays the stored error message.</span>")

(defun flyc/maybe-fixup-message (errore)
  "<span class="quote">pyflake is flakey if it has compile problems, this adjusts the
message to display, so there is one ;)</span>"
  (cond ((not (or (eq major-mode 'Python) (eq major-mode 'python-mode) t)))
        ((null (flymake-ler-file errore))
         <span class="linecomment">;; normal message do your thing</span>
         (flymake-ler-text errore))
        (t <span class="linecomment">;; could not compile error</span>
         (format "<span class="quote">compile error, problem on line %s</span>" (flymake-ler-line errore)))))


(defun flyc/show-stored-error-now ()
  "<span class="quote">Displays the stored error in the minibuffer.</span>"
  (interactive)
  (if flyc--e-at-point
      (progn
        (message "<span class="quote">%s</span>" (flyc/maybe-fixup-message flyc--e-at-point))
        (setq flyc--e-display-timer nil))))


(defun flyc/-get-error-at-point ()
  "<span class="quote">Gets the first flymake error on the line at point.</span>"
  (let ((line-no (line-number-at-pos))
        flyc-e)
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
          (setq flyc-e (car (second elem)))))
    flyc-e))


(defun flyc/show-fly-error-at-point-now ()
  "<span class="quote">If the cursor is sitting on a flymake error, display
the error message in the  minibuffer.</span>"
  (interactive)
  (if flyc--e-display-timer
      (progn
        (cancel-timer flyc--e-display-timer)
        (setq flyc--e-display-timer nil)))
  (let ((error-at-point (flyc/-get-error-at-point)))
    (if error-at-point
        (progn
          (setq flyc--e-at-point error-at-point)
          (flyc/show-stored-error-now)))))



(defun flyc/show-fly-error-at-point-pretty-soon ()
  "<span class="quote">If the cursor is sitting on a flymake error, grab the error,
and set a timer for \"pretty soon\". When the timer fires, the error
message will be displayed in the minibuffer.

This allows a post-command-hook to NOT cause the minibuffer to be
updated 10,000 times as a user scrolls through a buffer
quickly. Only when the user pauses on a line for more than a
second, does the flymake error message (if any) get displayed.

</span>"
  (if flyc--e-display-timer
      (cancel-timer flyc--e-display-timer))

  (let ((error-at-point (flyc/-get-error-at-point)))
    (if error-at-point
        (setq flyc--e-at-point error-at-point
              flyc--e-display-timer
              (run-at-time "<span class="quote">0.9 sec</span>" nil 'flyc/show-stored-error-now))
      (setq flyc--e-at-point nil
            flyc--e-display-timer nil))))



(eval-after-load "<span class="quote">flymake</span>"
  '(progn

     (defadvice flymake-goto-next-error (after flyc/display-message-1 activate compile)
       "<span class="quote">Display the error in the mini-buffer rather than having to mouse over it</span>"
       (flyc/show-fly-error-at-point-now))

     (defadvice flymake-goto-prev-error (after flyc/display-message-2 activate compile)
       "<span class="quote">Display the error in the mini-buffer rather than having to mouse over it</span>"
       (flyc/show-fly-error-at-point-now))

     (defadvice flymake-mode (before flyc/post-command-fn activate compile)
       "<span class="quote">Add functionality to the post command hook so that if the
cursor is sitting on a flymake error the error information is
displayed in the minibuffer (rather than having to mouse over
it)</span>"
       (set (make-local-variable 'post-command-hook)
            (cons 'flyc/show-fly-error-at-point-pretty-soon post-command-hook)))))


(provide 'flymake-cursor)</pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=flymake-cursor.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=flymake-cursor.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=flymake-cursor.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=flymake-cursor.el">Administration</a></span><span class="time"><br /> Last edited 2011-09-05 21:56 UTC by <a class="author" title="from 91-65-137-66-dynip.superkabel.de" href="http://www.emacswiki.org/emacs/pipping">pipping</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=flymake-cursor.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
