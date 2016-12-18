// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function (){


	$(window).scroll(function(){
			   if ($(this).scrollTop() > 600) {
			        $('.arriba').fadeIn();
			   } else {
			        $('.arriba').fadeOut();
			   }
			});
	

})





function comenzar(){


					$(document).ready(function() {
             

             		$(".imagen_oculta").hide();

							
								$("#ch_imagen").change(function(event) {
											 
											 if( $(this).prop('checked') ) {
														$(".imagen_oculta").fadeIn(2500);
												}else{
															 $(".imagen_oculta").fadeOut(2500);
														 }

								});
								


								/// PARA EL CAPTCHA
								var valor=Math.random().toString(36).substring(7);
								$("#mi_captcha").text(valor);
								
						/// OCULTO LABEL ERROR
						$(".oculto_correo").hide();
		        	$(".oculto_captcha").hide();
						$(".oculto_mensaje").hide();

							//// VALIDA FORMULARIO..
						$(".btn_enviar").click(function(event) {
											
											// Almaceno los valores
					  var email=$("#txt_email").val();
						var mensaje=$("#txt_mensaje").val();
						var captcha=	$("#txt_captcha").val();
									 
						var estado=true;

						/// Valido el email
						if(validarEmail(email) == false){
											$(".oculto_correo").fadeIn(2500);
											$("#txt_email").text("");
											$("#txt_email").focus();
											estado=false;
						}else if($("#txt_mensaje").val()==""){
								$(".oculto_mensaje").fadeIn(2500);
								$("#txt_mensaje").focus();
								estado=false;
						}else if(valor!=captcha){
						 $(".oculto_captcha").fadeIn(2500);
						 $("#txt_captcha").text("");
						 $("#txt_captcha").focus();
						 	  estado=false;
					 }else{
					 	estado=true;
					 }

	if(estado){		 /// SI LAS VALIDACIONES SON CORRECTAS LO ENVIO
					   $(".new_comentario").submit(function(e){					
										 $(".new_comentario").submit();
														 $("#txt_email").text("");
														 $("#txt_sitio").text("");
														 $("#txt_captcha").text("");
														 $("#txt_mensaje").text("");
															$("#txt_email").focus();
								});
							}else{
								return false;
							}
					});




});

function validarEmail(valor) {
	if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)){
			return true;
				} else {
				 return false;
				}
      }

}


function validar_respuestas(comentario_id){


			$(function(){

			                 
             		$(".imagen_oculta_" + comentario_id).hide();

							
								$("#ch_imagen_"+comentario_id).change(function(event) {
											 
											 if( $(this).prop('checked') ) {
														$(".imagen_oculta_"+comentario_id).fadeIn(2500);
												}else{
															 $(".imagen_oculta_"+comentario_id).fadeOut(2500);
														 }

								});

					/// PARA EL CAPTCHA
					var valor=Math.random().toString(36).substring(7);
				
					$("#mi_captcha_2_"+comentario_id).text(valor);
				
					$("#mi_captcha_2_"+comentario_id).css({
						background:"red",
						fontSize: "22px",
						width: "110px",
						height: "35px",
						textAlign: "center",
						fontWeight: "bold",
						fontFamily: "Comic Sans Ms",
						marginBottom: "10px",
						marginTop: "10px"	
					});

						//// OCULTO LABELS
					$(".oculto_email_resp_"+comentario_id).hide();
					$(".oculto_captcha_resp_"+comentario_id).hide();
					$(".oculto_mensaje_resp_"+comentario_id).hide();


					/// VALIDO FORM RESPUESTA
					$(".btn_enviar_respuestas_"+comentario_id).click(function(event) {
					
					 	   var email=$(".txt_email_resp_"+comentario_id).val();
							var captcha=$(".txt_captcha_resp_"+comentario_id).val();
							var mensaje=$(".txt_mensaje_resp_"+comentario_id ).val();


							var estado=true;

							if(validarEmail_resp(email)==false){
								$(".oculto_email_resp_"+comentario_id).fadeIn(2000);
						  	  $(".txt_email_resp_"+comentario_id).text("");
								 $(".txt_email_resp_"+comentario_id).focus();
									 estado=false;
							}else if (mensaje=="") {
								   $(".oculto_mensaje_resp_"+comentario_id).fadeIn(2000);
									 $(".txt_mensaje_resp_"+comentario_id).text("");
									 $(".txt_mensaje_resp_"+comentario_id).focus();
									 estado=false;
							}else if(captcha!=valor){
  									$(".oculto_captcha_resp_"+comentario_id).fadeIn(2000);
									 $(".txt_captch_resp_"+comentario_id).text("");
									 $(".txt_captcha_resp_"+comentario_id).focus();
									 estado=false;
							}else{
								estado=true;
							}


				if(estado){

								$("#respuesta_comentario_"+comentario_id).submit(function(e){					
					
								 $("#respuesta_comentario_"+comentario_id).submit();
								 $(".txt_email_resp_"+comentario_id).text("");
								 $(".txt_sitio_resp_"+comentario_id).text("");
								 $(".txt_captcha_resp_"+comentario_id).text("");
								 $(".txt_mensaje_resp_"+comentario_id).text("");
								 $(".txt_email_resp_"+comentario_id).focus();
								
								});

							}else{
									  return false;		
							}

						
					});




			})



function validarEmail_resp(valor) {
	if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)){
			return true;
				} else {
				 return false;
				}
      }

}

	








