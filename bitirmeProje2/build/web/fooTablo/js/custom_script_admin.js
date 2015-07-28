$(document).ready(function(){
	
	$(".bolum-select").selectpicker();
	$(".fakulte-select").selectpicker();
	$(".ders-select").selectpicker();
	$(".derslik-select").selectpicker();
	$(".arastirmagorevlisi1-select").selectpicker();
	$(".arastirmagorevlisi2-select").selectpicker();
	$(".fakulte-select").selectpicker();
	
	
	$("#buttonSinav").click(function() {
	    getValueUsingClassDerslik();
	});
	
	function getValueUsingClassDerslik(){
		var Array = [];
		
		$("#derslikk:checked").each(function() {
			Array.push($(this).val());
		});
		
		var selected;
		selected = Array.join(',');
		
//		if(selected.length > 1){
//			alert("Secilen derslikler " + selected);	
//		}else{
//			alert("Lutfen bir deger seciniz");	
//		}
	}
	
	$("#buttonSinav").click(function() {
	    getValueUsingClassArs();
	});
	
	function getValueUsingClassArs(){
		var chkArray = [];
		
		$("#ars:checked").each(function() {
			chkArray.push($(this).val());
		});
		
		var selected;
		selected = chkArray.join(',');
		
		if(selected.length > 1){
			alert("Secilen arastirma gorevlileri " + selected);	
		}else{
			alert("Lutfen bir deger seciniz");	
		}
	}
//$("#derslik").multiselect();

	
//	$("#arastirmagorevlisi").multiselect();
	
//	var values = $("select").val();
	
//	var array_of_checked_values = $("select").multiselect("getChecked").map(function(){
//		   return this.value;    
//		}).get();

	
	$('.table-sort').click(function (e) {
	    e.preventDefault();

	    //get the footable sort object
	    var footableSort = $('table').data('footable-sort');

	    //get the index we are wanting to sort by
	    var index = $(this).data('index');

	    //get the sort order
	    var ascending = $(this).data('ascending');

	    footableSort.doSort(index, ascending);
	});
  

	$("#EditDuyuruModal").on('show.bs.modal',function(e){
		$(this).find('#duyuruID').val($(e.relatedTarget).data('duyuru-no'));
		$(this).find('#aciklama').val($(e.relatedTarget).data('aciklama'));
	});
	
	$("#EditKuralModal").on('show.bs.modal',function(e){
		$(this).find('#kuralID').val($(e.relatedTarget).data('kural-no'));
		$(this).find('#ad').val($(e.relatedTarget).data('kural-ad'));
	});
	
	$("#EditDerslikModal").on('show.bs.modal',function(e){
		$(this).find('#derslikid').val($(e.relatedTarget).data('derslik-no'));
		$(this).find('#derslikad').val($(e.relatedTarget).data('derslik-ad'));
		$(this).find('#sirasayisi').val($(e.relatedTarget).data('sirasayisi'));
	});
	
	$("#EditDersModal").on('show.bs.modal',function(e){
		$(this).find('#dersID').val($(e.relatedTarget).data('ders-no'));
		$(this).find('#dersad').val($(e.relatedTarget).data('ders-ad'));
	});
	
	$("#EditBolumModal").on('show.bs.modal',function(e){
		$(this).find('#bolumID').val($(e.relatedTarget).data('bolum-no'));
		$(this).find('#bolumad').val($(e.relatedTarget).data('bolum-ad'));
	});
	
	$("#EditHocaModal").on('show.bs.modal',function(e){
		$(this).find('#hocaID').val($(e.relatedTarget).data('hoca-no'));
		$(this).find('#hocaAd').val($(e.relatedTarget).data('hoca-ad'));
		$(this).find('#hocaSoyad').val($(e.relatedTarget).data('hoca-soyad'));
	});
	
	$("#EditArsModal").on('show.bs.modal',function(e){
		$(this).find('#arsgorID').val($(e.relatedTarget).data('arsgor-no'));
		$(this).find('#arsgorAd').val($(e.relatedTarget).data('arsgor-ad'));
		$(this).find('#arsgorSoyad').val($(e.relatedTarget).data('arsgor-soyad'));
	});
	$("#EditSinavModal").on('show.bs.modal',function(e){
		$(this).find('#sinavID').val($(e.relatedTarget).data('sinav-no'));
		$(this).find('#sinavtarih').val($(e.relatedTarget).data('sinav-tarih'));
		$(this).find('#sinavsaat').val($(e.relatedTarget).data('sinav-saat'));
	});
	
	$('#dersekle').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Ders adi gereklidir"
                    }
                }
            }
        }
    });
	
	$('#kuraldegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            ad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Bu alan bos birakilamaz"
                    }
                }
            }
        }
    });
	
	$('#duyurudegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	aciklama: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Bu alan bos birakilamaz"
                    }
                }
            }
        }
    });
	
	$('#hocaekle').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	username: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Kullanici adi gereklidir'
                    },                   
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'Kullanici adi en az 6 en fazla 30 karakterden olusmalidir'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'Kullanici adinda harfler,sayilar ve alt cizgi kullanabilirsiniz'
                    }
                }
            },
            password: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Sifre Gereklidir Bos birakilamaz'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'Sifre en az 6  en fazla 30 karakterden olusmalidir'
                    },
                    identical: {
                        field: 'repeatpassword',
                        message: 'Sifreler uyusmuyor'
                    },
                }
            },
            repeatpassword: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Bu alan bos birakilamaz'
                    },
                    identical: {
                        field: 'password',
                        message: 'Sifreler uyusmuyor'
                    }
                }
            },
            name: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Isim gereklidir"
                    }
                }
            },
            lastname: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Soyad gereklidir'
                    }
                    
                }
            }
        }
    });
	
	$('#arastirmagorevlisiekle').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Isim gereklidir"
                    }
                }
            },
            lastname: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Soyad gereklidir'
                    }
                }
            }
        }
    });
	
	$('#sinavekle').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	tarih: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Sinav Tarihi gereklidir"
                    }
                }
            },
            saat: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Sinav Saati gereklidir'
                    }
                }
            }
        }
    });
	
	$('#derslikekle').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	name: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Derslik Adi gereklidir"
                    }
                }
            },
            sirasayisi: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Sira sayisi gereklidir ve bos birakilamaz'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Sira sayisi sayilardan olusmalidir'
                    }
                }
            }
        }
    });
	
	$('#bolumdegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	bolumad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Bolum Adi gereklidir"
                    }
                }
            }
        }
    });
	
	$('#sinavdegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	sinavtarih: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Sinav Tarihi gereklidir"
                    }
                }
            },
            sinavsaat: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Sinav Saati gereklidir'
                    }
                }
            }
        }
    });
	
	$('#derslikdegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	derslikad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Derslik Adi gereklidir"
                    }
                }
            },
            sirasayisi: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Sira sayisi gereklidir ve bos birakilamaz'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Sira sayisi sayilardan olusmalidir'
                    }
                }
            }
        }
    });
	
	$('#dersdegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	dersad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Ders adi gereklidir"
                    }
                }
            }
        }
    });
	
	$('#hocadegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	hocaAd: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Isim gereklidir"
                    }
                }
            },
            hocaSoyad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Soyad gereklidir"
                    }
                }
            }
        }
    });
	
	$('#arastirmagorevlisidegistir').bootstrapValidator({
        message: 'Bu deger gecerli degil',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	arsgorAd: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message : "Isim gereklidir"
                    }
                }
            },
            arsgorSoyad: {
                message: 'Bu alan bos birakilamaz',
                validators: {
                    notEmpty: {
                        message: 'Soyad gereklidir'
                    }
                }
            }
        }
    });
});