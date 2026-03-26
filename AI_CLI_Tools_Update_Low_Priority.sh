#!/bin/bash

# =================================================================
# [ AI CLI Tools Update Script for Ubuntu ]
# =================================================================

# nvm 로드 (root)
export NVM_DIR="/root/.nvm"
source $NVM_DIR/nvm.sh

# 로그 파일 경로 설정 (선택 사항)
LOG_FILE="/var/log/AI_CLI_Tools_Update.log"

# 저부하 실행 명령어 정의
# nice -n 10: CPU 우선순위를 낮춤 (0~19 중 10)
# ionice -c 2 -n 7: 디스크 I/O 우선순위를 'Best-effort' 등급의 가장 낮은 단계로 설정
LOW_PRIO="nice -n 10 ionice -c 2 -n 7"

echo "------------------------------------------" >> $LOG_FILE
echo "시작 시간: $(date) (Low Priority Mode)" >> $LOG_FILE

# 1. Gemini CLI Update
echo "[1/3] Updating @google/gemini-cli..." >> $LOG_FILE
$LOW_PRIO npm update -g @google/gemini-cli >> $LOG_FILE 2>&1

# 2. OpenAI Codex Update
echo "[2/3] Updating @openai/codex..." >> $LOG_FILE
$LOW_PRIO npm update -g @openai/codex >> $LOG_FILE 2>&1

# 3. GitHub Copilot Update
echo "[3/3] Updating @github/copilot..." >> $LOG_FILE
$LOW_PRIO npm update -g @github/copilot >> $LOG_FILE 2>&1

echo "모든 업데이트 완료: $(date)" >> $LOG_FILE
echo "------------------------------------------" >> $LOG_FILE
