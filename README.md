Firebase Jekyll Comments
======================

[Jekyll](http://jekyllrb.com/) is the coolest static-everything blogging platform out there, but if you came from a more dynamic blogging platform, you probably miss comments. I know I do. 

<h3 style="float: left;">Unsocial Blogging</h3>
<img style="float: left;" src="https://github.com/mimming/firebase-jekyll-comments/raw/master/docs/forever-alone.png">

<h3 style="float: right;">The Solution</h3>
<img style="float: right;" src="https://github.com/mimming/firebase-jekyll-comments/raw/master/docs/firebase-jekyll.png">

<div style="clear: both;">

Anyway, here's a handy dandy include for Jekyll that adds real time comments to your blog without any backend code. The backend part is handled by [Firebase](https://firebase.com)

Interested? Check out a [live demo](https://jekyll-commetns-demo.firebaseapp.com).

## Setup

1. Create a [new Firebase](https://www.firebase.com/account/) for your blog comments.
1. Paste the contents of [`firebase-security-rules.json`](firebase-security-rules.json) into the
   [security rules](https://www.firebase.com/docs/security/guide.html) pane for your Firebase.
1. Copy the files from [_includes](/mimming/firebase-blog-comments/tree/master/_includes) into the `_includes` folder in the root of your blog. Create the directory if it does not already exist.
2. Edit your `_config.yaml` and specify three new properties:
   - `fbc-comments-firebase` - The URL of the Firebase to host your comments, e.g. https://myawesomeblog-comments.firebaseio.com/
   - `fbc-default-picture` - The URL of a picture to represent users who don't have one for some reason
   - `fbc-default-link` - Same deal as above, but for users who have no profile for one reason or another
4. [`_includes/firebase-comment-form-template.html`](_includes/firebase-comment-form-template.html) represents your comments form. Edit it to match your blog.
   - Use the same markup as the rest of your blog. Jekyll interprets it like any other include at build time. 
   - Preserve the `fbc-*` element ids. They are required by the plugin to function.
5. [`_includes/firebase-comment-template.html`](includes/firebase-comment-template.html) represents an individual comment. Edit it to match your blog.
   - Use the same markup as the rest of your blog. Jekyll interprets it like any other include at build time.
   - It is further processed with a JavaScript template engine at the time of rendering. Use these template tags:
       - `<%=link %>` - Commenter's profile URL
       - `<%=picture %>` - The beautiful mug shot of your commenter
       - `<%=displayName %>` - Their name
       - `<%=comment %>` - What they said about your stuff
6. Enable SimpleLogin and add API keys and secrets to forge for [Facebook](https://www.firebase.com/docs/web/guide/simple-login/facebook.html), [Twitter](https://www.firebase.com/docs/web/guide/simple-login/twitter.html), [GitHub](https://www.firebase.com/docs/web/guide/simple-login/github.html), and [Google](https://www.firebase.com/docs/web/guide/simple-login/google.html).
7. Add the include to the appropriate layout files.

        {% include firebase-comments.ext %}
