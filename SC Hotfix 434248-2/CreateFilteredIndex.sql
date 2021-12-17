IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX_Versioned_Locks_Filtered' AND object_id = OBJECT_ID('dbo.VersionedFields'))
    BEGIN
        CREATE NONCLUSTERED INDEX IX_Versioned_Locks_Filtered
		ON [dbo].[VersionedFields] ([ItemID])
		INCLUDE ([Value],[Language],[Version])
		WHERE [FieldId] = '{001DD393-96C5-490B-924A-B0F25CD9EFD8}'
    END;