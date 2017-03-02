$(function() {
	"use strict";

	$('#content').artEditor({
		imgTar: '#imageUpload',
		limitSize: 5,   // 兆
		showServer: false,
		uploadUrl: '',
		data: {},
		uploadField: 'image',
		placeholader: '<p>请输入问题描述</p>',
		validHtml: ["<br/>"],
		formInputId: 'target',
		uploadSuccess: function(res) {
			// return img url
			return res.path;
		},
		uploadError: function(res) {
			// something error
			console.log(res);
		}
	});
});
