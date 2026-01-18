function webp-random --description "批量转换当前目录图片为 WebP 并用随机 Base64 重命名"
    # 参数解析
    argparse 'q/quality=?!_validate_int' 'r/resize=' 'h/help' -- $argv
    or return 1

    if set -q _flag_help
        echo "用法: webp-random [选项]"
        echo ""
        echo "选项:"
        echo "  -q, --quality NUM   质量 1-100（默认 75）"
        echo "  -r, --resize WxH    缩放尺寸，如 1920x0（0=自动比例）"
        echo "  -h, --help          显示帮助"
        echo ""
        echo "示例:"
        echo "  webp-random              # 默认质量 75"
        echo "  webp-random -q 60        # 更小体积"
        echo "  webp-random -r 1920x0    # 限制宽度 1920，高度自适应"
        echo "  webp-random -q 70 -r 1600x0"
        return 0
    end

    # 默认值
    set -l quality (test -n "$_flag_quality" && echo $_flag_quality || echo 75)
    set -l resize_opt ""

    if set -q _flag_resize
        set resize_opt "-resize $_flag_resize"
    end

    # 创建输出文件夹
    mkdir -p webp

    # 统计
    set -l count 0
    set -l total (command find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | count)

    if test $total -eq 0
        echo "❌ 当前目录没有找到 jpg/jpeg/png 图片"
        return 1
    end

    echo "🚀 发现 $total 张图片（质量: $quality, 缩放: "(test -n "$resize_opt" && echo $_flag_resize || echo "原尺寸")"）"

    for file in (command find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | string replace './' '')
        if test -f "$file"
            set -l name (openssl rand -base64 12 | string replace -ra '[+/=]' '' | string sub -l 11)

            # -m 6 最大压缩，-preset photo 照片优化
            eval cwebp -quiet -q $quality -m 6 -preset photo $resize_opt "\"$file\"" -o "\"webp/$name.webp\""

            set count (math $count + 1)
            set -l orig_size (stat -f%z "$file" | awk '{printf "%.1fM", $1/1024/1024}')
            set -l new_size (stat -f%z "webp/$name.webp" | awk '{printf "%.1fM", $1/1024/1024}')
            echo "✓ $count/$total: $file ($orig_size) → $name.webp ($new_size)"
        end
    end

    # 汇总
    set -l orig_total (command find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec stat -f%z {} + | awk '{s+=$1} END {printf "%.1fM", s/1024/1024}')
    set -l new_total (command find webp -name "*.webp" -exec stat -f%z {} + | awk '{s+=$1} END {printf "%.1fM", s/1024/1024}')

    echo ""
    echo "🎉 完成！$orig_total → $new_total"
    echo "   路径: "(pwd)/webp
end
