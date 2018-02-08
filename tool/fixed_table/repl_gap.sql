CREATE OR REPLACE VIEW ADM_REPL_GAP AS
SELECT TRUNC((((B.LST_LSN_FILE - A.XLSN_FILE ) * C.LOG_FILE_SIZE) + 
       B.LST_LSN_OFFSET - A.XLSN_OFFSET) / C.LOG_fILE_sIZE) AS FILE_GAP,
      MOD ((((B.LST_LSN_FILE - A.XLSN_FILE ) * C.LOG_FILE_SIZE) + 
       B.LST_LSN_OFFSET - A.XLSN_OFFSET),  C.LOG_fILE_sIZE) AS OFFSET_GAP
FROM SYSTEM_.SYSX_REPL_sENDER_ A,
     SYSTEM_.SYSX_LOG_ B,
     SYSTEM_.SYSX_DB_ C;
