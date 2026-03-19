#!/bin/bash

# =================================================================
# [ AI CLI Tools Update Script for Ubuntu ]
# =================================================================

# 로그 파일 경로 설정 (선택 사항)
LOG_FILE="/var/log/AI_CLI_Tools_update.log"

echo "------------------------------------------" >> $LOG_FILE
echo "시작 시간: $(date)" >> $LOG_FILE

# 1. Gemini CLI Update
echo "[1/3] Updating @google/gemini-cli..." >> $LOG_FILE
npm update -g @google/gemini-cli >> $LOG_FILE 2>&1

# 2. OpenAI Codex Update
echo "[2/3] Updating @openai/codex..." >> $LOG_FILE
npm update -g @openai/codex >> $LOG_FILE 2>&1

# 3. GitHub Copilot Update
echo "[3/3] Updating @github/copilot..." >> $LOG_FILE
npm update -g @github/copilot >> $LOG_FILE 2>&1

echo "모든 업데이트 완료: $(date)" >> $LOG_FILE
echo "------------------------------------------" >> $LOG_FILE
