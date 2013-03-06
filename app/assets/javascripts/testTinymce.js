var tinyMCEImageList = new Array(
        // Name, URL
        ["Logo 1", "/assets/rails.png"],
        ["Logo 2 Over", "/assets/path.jpg"]
);

// Вставка самого тега: #f.text_area :content, :cols => 70, :rows => 20, :id => 'markItUp_admin', :class => 'tinymce' 

tinyMCE.init({
    mode: 'textareas',
    theme: 'advanced',
    plugins: "uploadimage,advimage,syntaxhl",
    uploadimage_form_url: "/attachments",
    theme_advanced_buttons3: 'morebutton,uploadimage,syntaxhl,hr,removeformat,visualaid,|,sub,sup,|,charmap',
    width : "640",
    relative_urls : false,
    document_base_url : "/", 
    external_image_list_url : "/posts/image_gallery.js",
    remove_linebreaks : false, 
    extended_valid_elements : "textarea[cols|rows|disabled|name|readonly|class]",
    setup : function(ed) {
        // Add a custom button
        ed.addButton('morebutton', {
            title : 'Читать дальше',
            image : '/assets/sidebar-more.png',
            onclick : function() {
                // Add you own code to execute something on click
                ed.focus();
                ed.selection.setContent('<!--more-->');
            }
        });
    } 
  });*/
/*  plugins : "syntaxhl", 
  theme_advanced_buttons1 : "bold,italic,underline,undo,redo,link,unlink,image,forecolor,styleselect,removeformat,cleanup,code, syntaxhl",
  theme_advanced_buttons2 : "", 
  theme_advanced_buttons3 : "", 
  remove_linebreaks : false, 
  extended_valid_elements : "textarea[cols|rows|disabled|name|readonly|class]"*/ 