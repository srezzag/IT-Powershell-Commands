<#

	COMPUTER CHANGES CREATED / CHANGED
			ADComputerCreatedChanged

	COMPUTER CHANGESDETAILED
			ADComputerChangesDetailed

	COMPUTER DELETED
			ADComputerDeleted

	GROUP CHANGES
			ADGroupChanges

	GROUP CHANGESDETAILED
			ADGroupChangesDetailed

	GROUP CHANGESCREATED / DELETED
			ADGroupCreateDelete

	GROUP ENUMERATION
			ADGroupEnumeration

	GROUP MEMBERSHIP CHANGES
			ADGroupMembershipChanges

	GROUP POLICY CHANGES
			ADGroupPolicyChanges

	LOGS CLEARED OTHER
			ADLogsClearedOther

	LOGS CLEARED SECURITY
			ADLogsClearedSecurity

	USER CHANGES
			ADUserChanges

	USER CHANGES DETAILED
			ADUserChangesDetailed

	USER LOCKOUTS
			ADUserLockouts

	USER LOGON
			ADUserLogon

	USER LOGON KERBEROS
			ADUserLogonKerberos

	USER STATUS CHANGES
			ADUserStatus

	USER UNLOCKS
			ADUserUnlocked

#>

Find-Events -Report ADGroupMembershipChanges -DatesRange Last3days -Servers AD1, AD2 | Format-Table -AutoSize
