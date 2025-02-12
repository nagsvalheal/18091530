/**
*@description	Controller class responsible for handling community-related tasks. This class
*				includes methods to fetch tasks associated with community posts, specifically
*				targeting those that are unread and in progress.
*History
*Version	Author			Date		Detail		Description
*1.0		Niyas		24-07-2024		Created		Refactored Version
*/
public with sharing class BI_PSPB_CommunityTaskQueryCtrl {
/**
*@description	Fetches a list of pending community post tasks that are unread
*				and currently in progress.The method queries the 
*				Task object based on specific conditions related to community posts.
*@return	A list of Task records that meet the criteria specified in the conditions.
*			The list contains tasks with fields such as Id, WhatId,
*			BI_PSP_CommunityPostStatus__c,
*			BI_PSP_ChatterType__c, BI_PSP_Category__c, Status,
*			and BI_PSP_CommunityUserName__c.
*/
public static List<Task> fetchPendingCommunityPosts() {
	String fields = 'Id, WhatId, BI_PSP_CommunityPostStatus__c, BI_PSP_ChatterType__c, BI_PSP_Category__c, Status, BI_PSP_CommunityUserName__c';
	String conditions =
	'BI_PSP_Category__c = \'' +
	BI_PSPB_NotificationConstant.actionTypeGeneralCommunity +
	'\' ' +
	'AND BI_PSP_ChatterType__c = \'' +
	BI_PSPB_NotificationConstant.createPost +
	'\' ' +
	'AND Status = \'' +
	BI_PSPB_NotificationConstant.actionTypeUnRead +
	'\' ' +
	'AND BI_PSP_CommunityPostStatus__c = \'' +
	BI_PSPB_NotificationConstant.inProgressType +
	'\' ';
	List<SObject> results = BI_PSP_CommonQueryUtility.executeQuery(
	'Task',
	fields,
	conditions,
	false
	);
	return (List<Task>) results;
}
}