/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// config.skin = 'kama';
//       config.height = '800px';
       config.height = '800vh';

    var duong_dan='/liberty/pioneergreen/js/ckeditor/';
    config.filebrowserBrowseUrl         =duong_dan+ 'ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl  	=duong_dan+ 'ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl 	=duong_dan+ 'ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl 	=duong_dan+ 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl 	=duong_dan+ 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl 	=duong_dan+ '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
       //config.filebrowserUploadUrl = 'ckeditor/ckupload.php';
	// Define changes to default configuration here. For example:
	//config.language = 'fr';
	// config.uiColor = '#AADC6E';
};
