<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="delcfmOverhaul">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 隐藏需要删除的id -->
                <input type="hidden" id="deleteHaulId"/>
                <input type="hidden" id="delUrl"/>
                <p>您确认要删除该条信息吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary"
                        id="deleteHaulBtn" onclick="delRow()">确认
                </button>
            </div>
        </div>
    </div>
</div>
