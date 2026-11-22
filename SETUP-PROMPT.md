# 发给 Codex / Claude 的安装指令（复制下面整段）

请帮我在这台电脑上安装一套 AI skill 和规则，让 Codex 和 Claude Code 在所有项目里都能用：

1. GitHub 仓库：https://github.com/xiaohongshucourse/new ，分支：`ccr-74f0be78-e0b5gz`（还没合并进主分支，所以必须用这个分支）。
2. 把它下载到本机：`git clone -b ccr-74f0be78-e0b5gz https://github.com/xiaohongshucourse/new.git`
3. 进入下载好的文件夹，运行：`bash install-global.sh`
4. skill 存放位置：仓库里的 `.claude/skills/`。脚本会把它们装到 `~/.claude/skills`（Claude 用）和 `~/.agents/skills`（Codex 用），并把规则写入 `~/.claude/CLAUDE.md` 和 `~/.codex/AGENTS.md`。
5. 装好后告诉我：装了哪些 skill、规则有没有写进去。然后读一遍 `AGENTS.md`，确认你知道里面的规则，之后照着做。

里面共 10 个 skill：ui-ux-pro-max、frontend-design、impeccable、taste-skill，加上 ponytail 系列 6 个（ponytail、ponytail-review、ponytail-audit、ponytail-debt、ponytail-gain、ponytail-help）。
以后我说"更新 skill 和规则"，你就在这个文件夹里 `git pull`，再运行一次 `bash install-global.sh`。
