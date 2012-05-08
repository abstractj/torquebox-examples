/*
 * JBoss, Home of Professional Open Source
 * Copyright 2012, Red Hat, Inc., and individual contributors
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
Core JavaScript functionality for the application.  Performs the required
Restful calls, validates return values, and populates the member table.
 */
/* Get the member template */
function getMemberTemplate(){$.ajax({url:"/templates/member.tmpl",dataType:"html",success:function(a){$("head").append(a),updateMemberTable()}})}function buildMemberRows(a){return _.template($("#member-tmpl").html(),{members:a})}function updateMemberTable(){$.ajax({url:"/members.json",cache:!1,success:function(a){$("#members").empty().append(buildMemberRows(a))},error:function(a){}})}function registerMember(a){$("span.invalid").remove(),$("span.success").remove(),$.ajax({url:"/members.json",contentType:"application/json",dataType:"json",type:"POST",data:JSON.stringify(a),success:function(a){$("#reg")[0].reset(),$("#formMsgs").append($('<span class="success">Member Registered</span>')),updateMemberTable()},error:function(a){if(a.status==409||a.status==400||a.status==422){var b=$.parseJSON(a.responseText);$.each(b,function(a,b){$('<span class="invalid">'+b+"</span>").insertAfter($("#"+a))})}else $("#formMsgs").append($('<span class="invalid">Unknown server error</span>'))}})};