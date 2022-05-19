$(document).ready(function(){
        var _URL = window.URL || window.webkitURL;
        var _width = 0;
        var _height = 0;
        var _size = 0;
        var _type = 0;
        var isUploadable = false;
        var blankObj = $("div#selectedFile").html();
        var _src = "";

        function checkFileForUpload(input){
            if (input.files && input.files[0]) {
                var file = input.files[0];
                var reader = new FileReader();
                var img = new Image();
                _type = file.type;

                img.onload = function(){
                    
                    _width = this.width;
                    _height = this.height;
                    _size = (file.size)/1024; // size in kb
                    
                    if(_type != "image/jpeg" && _type != "image/jpg" && _type != "image/png" ){
                        isUploadable = false;
                        alert("File type is not allowed");
                    } else{
                        isUploadable = true;
                        _src = (_URL).createObjectURL(file);
                    }

                    if( !isUploadable ){
                        input.value = "";
                        document.getElementById("fileSelector_placeholder").value = "";
                    }
                    
                }
                reader.onload = function (e) {
                    if(_type != "image/jpeg" && _type != "image/jpg" && _type != "image/png" ){
                        isUploadable = false;
                        alert("File type is not allowed");
                    } else{
                        isUploadable = true;
                        //$('#blah')[0].src = (_URL).createObjectURL(file);
                    }

                    if( !isUploadable ){
                        //alert(_width + "; " + _height + "; size: " + _size + "; type: " + _type);
                        input.value = "";
                        document.getElementById("fileSelector_placeholder").value = "";
                    }
                    //$('#blah').attr('src', e.target.result);
                }
                
                reader.readAsDataURL(input.files[0]);
                img.src = _URL.createObjectURL(input.files[0]);
            }
        }


        $(document).on("change", "input#fileSelector", function(e){
            checkFileForUpload(this);
            
        });
        
        $(document).on("click", "button#uploadImage", function(e){
            e.preventDefault();
            //var _input = document.getElementsByClassName('fileSelector');
            var _input = document.getElementById('fileSelector');
            checkFileForUpload(_input);
            var _title = $("input#fileTitle").val();
             if(_title.length>50){
               $("#fileTitle").css({"border-color":"red"});
               $(".notevalid").show(200).delay(300).hide(200,function(){
               $("#fileTitle").css({"border-color":"#ccc"});
               });
               error=true;
               }

            if( !isUploadable ){
                alert("Please, choose right file");
            } else if( _title == ""){
                alert("Please, type file title");
            }else{
                
                var formData = new FormData($("form#proposal_form")[0]);
                $.ajax({
                    url: base_url + 'Proposal/uploadProposalPhoto',
                    type: 'POST',
                    data: formData,
                    beforeSend: function() {
                     $.loadingBlockShow({
                        imgPath: base_url + 'assets/default.svg',
                        text: 'Uploading Photo ...',
                        style: {
                            position: 'fixed',
                            width: '100%',
                            height: '100%',
                            background: 'rgba(0, 0, 0, .8)',
                            left: 0,
                            top: 0,
                            zIndex: 10000
                        }
                    });
                    //$('.card').loading({ circles: 3,overlay: true });
                    },
                    async: false,
                    cache: false,
                    contentType: false, // jquery will not add content-type header
                    processData: false, // jquery will not convert form data into string
                    success: function (returndata) {
                        
                        if( returndata != "" && returndata.length <= 35 ){
                            var str = '<div style="width:100px;height:100%;float:left;margin-right:15px;text-align: center;">';
                            str += '<input type="hidden" name="fileNameList[]" value="'+returndata+'" /><input type="hidden" name="fileTitleList[]" value="'+_title+'" /><label style="margin-bottom: 10px;text-align: center;font-size:12px">'+_title+'</label>';
                            str += '<img class="previewImage img-thumbnail" src="'+_src+'" alt="" style="width: 100px; height: 100px; z-index:3;background:white;margin-bottom: 10px" />';
                            str += '<button class="btn btn-danger deleteUploadedFile" data-file="'+returndata+'" type="button" style="width:100%;height:25px;padding: 0 12px !important;" title="DELETE">DELETE</button>';
                            str += '</div>';

                            $("#fileContainer").append(str);

                            $("input#fileTitle").val("");
                            $("input#fileSelector_placeholder").val("");
                            $("input#fileSelector").val("");

                        }
                        
                    },
                  complete: function() {
                   setTimeout($.loadingBlockHide, 200);
                   // $('.card').loading({hide: true});
                    //$(".card").removeClass("js-loading");
                  }
                });
            }

        });

        $(document).on("click", "button.saveWordings", function(e){
            $("div.loading").show(1);

            var tId = $(this).data('textid');
            var txt = $(this).parent().children("div.note-editor").children("div.note-editable").html() + "";

            var proposalBody = 0;
            var proposalEmail = 0;
            var invocieEmail = 0;

            if( tId == "proposalBody" ){
                proposalBody = 1;
            } else if (tId == "proposalEmail") {
                proposalEmail=1;
            } else if(tId == "invocieEmail"){
                invocieEmail = 1;
            } else{
                //
            }

            txt = txt.replace(/style/g, "stl");

            var _data = {"txt" : txt, "proposalBody": proposalBody, "proposalEmail":proposalEmail, "invocieEmail":invocieEmail};

            $.ajax({
                url: base_url + 'Proposal/saveChangeWordings',
                type: 'POST',
                dataType: "text",
                data: _data,
                success: function(msg){
                    $("div.loading").hide(1);
                    if( msg == "1" ){
                        $("span.responseStatus").html('<div class="alert alert-info"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> Wordings has been updated successfully!</div>');
                    } else{
                        $("span.responseStatus").html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Unable to save, Please try again.</div>');
                    }
                },
                error: function(err){
                    $("span.responseStatus").html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Unable to save, Please try again.</div>');
                    $("div.loading").hide(1);
                    console.log(err);
                    
                }
            });
        });

        $(document).on("click", "button.deleteUploadedFile", function(e){
            e.preventDefault();
            var elTag = $(this).parent();
            var fileName = $(this).data("file");
            var _proposalId = $("input.proposalId").val();
            if(confirm("Are you sure to delete this?")){
                
                $.ajax({
                    url : base_url + 'Proposal/deleteProposalPhoto/',
                    type : "POST",
                    data: {
                        '_fileName': fileName,
                        '_proposalId':_proposalId
                    },
                    success : function(values) {
                        if( values == "1" || values == 1 ){
                            elTag.remove();
                        } else{
                            alert("Unable to delete");
                        }
                    },
                    complete: function() {
                        //
                    }
                });
                
            }
        });
        

    });