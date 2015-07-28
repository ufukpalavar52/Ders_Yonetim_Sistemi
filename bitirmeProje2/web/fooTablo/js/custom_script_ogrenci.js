$(document).ready(function(){

//	$(".bolum-select").selectpicker();
//	$(".fakulte-select").selectpicker();
//	$(".sinif-select").selectpicker();

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

$('#addogrenci').bootstrapValidator({
    message: 'Bu deger gecerli degil',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	bolum : {
    		validators : {
//    			notEmpty : {
//    				message : "boþ býrakman"
//    			},
    			stringLength : {
    				value : 1,
    				message : "bölüm seçin"
    			}
    		}
    	},
    	ogrencino: {
            message: 'Bu alan bos birakilamaz',
            validators: {
                notEmpty: {
                    message: 'Ogrenci numarasi gereklidir ve bos birakilamaz'
                },                   
                stringLength: {
                    min: 8,
                    max: 8,
                    message: 'Ogrenci numarasi 8 karakterden olusmalidir'
                },
                regexp: {
                    regexp: /^[0-9]+$/,
                    message: 'Ogrenci numarasi sayilardan olusmalidir'
                }
            }
        },
        ad: {
            message: 'Bu alan bos birakilamaz',
            validators: {
                notEmpty: {
                    message : "Isim gereklidir"
                }
            }
        },
        soyad: {
            message: 'Bu alan bos birakilamaz',
            validators: {
                notEmpty: {
                    message: 'Soyad gereklidir'
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
        
        sinif: {
            validators: {
                notEmpty: {
                    message: 'Lutfen sinifinizi seciniz.'
                }
            }
        },
        fakulte: {
            validators: {
                notEmpty: {
                    message: 'Lutfen fakultenizi seciniz.'
                }
            }
        },
        bolum: {
            validators: {
                notEmpty: {
                    message: 'Lutfen bolumunuzu seciniz.'
                }
            }
        },
        ogrenci_img:{
        	message : "Bu alan bos birakilamaz",
        	validators: {
                notEmpty: {
                    message: 'Lutfen resim ekleyiniz'
                },
                file:{
                	extension: 'jpeg,png,jpg',
                    type: 'image/jpeg,image/png',
                    maxSize: 4194304,   // 2048 * 1024
                    message: "Lutfen Resim seciniz."
                }
        	}
        }	
    }
});

$('#ayarlarForm').bootstrapValidator({
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
                    message : "Isim gereklidir"
                }
            }
        },
        soyad: {
            message: 'Bu alan bos birakilamaz',
            validators: {
                notEmpty: {
                    message: 'Soyad gereklidir'
                }
                
            }
        },
    	sinif: {
            message: 'Bu alan bos birakilamaz',
            validators: {
                notEmpty: {
                    message: 'Sinif gereklidir ve bos birakilamaz'
                },                   
                regexp: {
                    regexp: /^[0-9]+$/,
                    message: 'Sinif sayilardan olusmalidir'
                }
            }
        },
        password: {
            validators: {
                stringLength: {
                    min: 6,
                    max: 30,
                    message: 'Sifre en az 6 en fazla 30 karakterden olusmalidir'
                },
                regexp: {
                    regexp: /^[a-zA-Z0-9_]+$/,
                    message: 'Sifrede harfler,sayilar ve alt cizgi kullanabilirsiniz'
                },
                identical: {
                    field: 'repeatpassword',
                    message: 'Sifreler eslesmiyor'
                }
            }
        },
        repeatpassword: {
            validators: {
                stringLength: {
                    min: 6,
                    max: 30,
                    message: 'Sifre en az 6 en fazla 30 karakterden olusmalidir'
                },
                regexp: {
                    regexp: /^[a-zA-Z0-9_]+$/,
                    message: 'Sifrede harfler,sayilar ve alt cizgi kullanabilirsiniz'
                },
                identical: {
                    field: 'password',
                    message: 'Sifreler eslesmiyor'
                }
            }
        }
  	
    }
});

});