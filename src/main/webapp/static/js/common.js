function getJsp(url, method, data, statusId) {
    $.ajax({
        'url': url,
        'method': method,
        "data": data,
        "success":function (data) {
            $("#contentInnerId").html(data);
        }
    });
}


function delRow() {
    var id = $("#deleteHaulId").val();
    $("#delcfmOverhaul").hide();
    $("#delcfmOverhaul").modal('hide');
    var delUrl = $("#delUrl").val();
    $(".modal-backdrop").css('display', 'none');
    getJsp(delUrl, 'get', 'id='+id);

}

function showDeleteModal(url, dId) {
    $("#deleteHaulId").val(dId);// 将模态框中需要删除的大修的ID设为需要删除的ID
    $("#delUrl").val(url);
    $("#delcfmOverhaul").modal({
        backdrop : 'static',
        keyboard : false
    });
}

function uploadPic(picId, filePathId, showImgId) {
    var formData = new FormData();
    formData.append("file", $("#"+picId)[0].files[0]);
    $.ajax({
        url: '/file/upload',
        type: 'POST',
        async: false,
        data: formData,
        processData: false, // 使数据不做处理
        contentType: false, // 不要设置Content-Type请求头
        success: function (data) {
            $("#"+showImgId).attr('src', data);
            $("#"+filePathId).val(data);

        },
        'error': function (errorr) {
            alert("上传失败，请重新上传");
        }
    })

}