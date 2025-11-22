# Fish-exa 插件配置
# 自定义 eza 显示选项

# 标准选项：所有基础命令都会使用（添加图标支持）
set -gx EXA_STANDARD_OPTIONS --group --header --group-directories-first --icons

# ll 命令选项（长格式 + 图标）
set -gx EXA_LL_OPTIONS --long --icons

# 其他命令的图标选项
set -gx EXA_LI_OPTIONS --icons
set -gx EXA_LAI_OPTIONS --all --binary --icons
