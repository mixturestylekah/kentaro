var Editor = {
  init: function() {
    /*** Simply return if it's not editor page ***/
    if (!$('[data-page="main-editor"]').length > 0) {
      return;
    }

    var editor = new MediumEditor('.medium-editable', {
      placeholder: {
        text: "記入欄"
      }
    });

    $('.medium-editable').mediumInsert({
      editor: editor,
      addons: {
        images: {
          fileUploadOptions: { // TODO: figure out how to upload pictures to AS3
            url: $('.editor-form').attr('action'),
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            method: 'PATCH'
          }
        },
        embeds: {
          oembedProxy: null
        }
      }
    });

    // preload tags if its edit.
    var tag_string = $('[data-behavior="tags"]').data("tags");
    var tags = tag_string.length > 0 ? tag_string.split(', ') : ['Story', 'Music'];

    var my_taggle = new Taggle('js-taggle', {
      duplicateTagClass: 'bounce',
      tags: tags,
      preserveCase: true
    });

    // FIXME: is there a better way to do this?
    $('[data-behavior="publish-button"').hover(function() {
      $('#blog_all_tags').val(my_taggle.getTagValues());
    });

    $("#blog_image").change(function(){
      Editor.readURL(this);
      $('#image-preview').addClass('hidden');
      $('.image_upload').addClass('active');
      $('.image_upload-preview').removeClass('hidden');
    });

    /*** Autosave ***/
    $('[data-behavior="autosave"]').autoSave(function() {
      $('[data-behavior="editor-message"]').text('Saving...');
      $('#blog_all_tags').val(my_taggle.getTagValues());
      Editor.postAutosave($('.editor-form').attr('action'),
                   $('input[name="_method"]').val(),
                   $('#blog_title').val(),
                   $('#blog_body').val(),
                   $('#blog_all_tags').val()
                  );
    }, 500);

    /*** Form submit ***/
    $('[data-behavior="publish-button"]').on('click', function() {
      $('.editor-form').submit();
    });

    $('.publish-dropdown').on('click', function(e) {
      e.stopPropagation();
    });

  },

  readURL: function(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#image_preview').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  },

  postAutosave: function(url, method, title, description, body, all_tags) {
    $.ajax({
      url: '/api' + url,
      dataType: "script",
      method: method || "POST",
      data: {
        blog: {
          title: title,
          body: body,
          destroy: description,
          all_tags: all_tags
        }
      },
      success: function() { console.log('autosave successful'); }
    });
  }

};

$(document).ready( Editor.init );
$(document).on( 'page:load', Editor.init );
