#!/bin/bash

# 定义路径数组
paths=(
"emulators/RetroArch/_base_/RetroArch/@ROM/3DO/"
"emulators/RetroArch/_base_/RetroArch/@ROM/3DS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/ATARI2600/"
"emulators/RetroArch/_base_/RetroArch/@ROM/ATARI5200/"
"emulators/RetroArch/_base_/RetroArch/@ROM/ATARI7800/"
"emulators/RetroArch/_base_/RetroArch/@ROM/DC hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/DC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/DOS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBA ACT hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ACT V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ACT hack1/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ACT hack2/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ACT/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ETC V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO ETC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO FLY V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO FLY/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO FTG hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO FTG/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO RAC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO STG V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO STG hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FBNEO STG/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FC hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FC-HD/"
"emulators/RetroArch/_base_/RetroArch/@ROM/FC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/GAME WATCH/"
"emulators/RetroArch/_base_/RetroArch/@ROM/GB/"
"emulators/RetroArch/_base_/RetroArch/@ROM/GBA/"
"emulators/RetroArch/_base_/RetroArch/@ROM/GBC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/GG/"
"emulators/RetroArch/_base_/RetroArch/@ROM/LIGHT GUN/"
"emulators/RetroArch/_base_/RetroArch/@ROM/LYNX/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME ACT/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME ETC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME FLY V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME FLY/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME FTG hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME FTG/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME RAC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME STG V/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MAME STG/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MD hack(picodrive)/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MD hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MD-32X/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MD-CD/"
"emulators/RetroArch/_base_/RetroArch/@ROM/MD/"
"emulators/RetroArch/_base_/RetroArch/@ROM/N64/"
"emulators/RetroArch/_base_/RetroArch/@ROM/NAOMI/"
"emulators/RetroArch/_base_/RetroArch/@ROM/NDS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/NEOGEO-CD/"
"emulators/RetroArch/_base_/RetroArch/@ROM/NGC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/NGPC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PC-FX/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PCE-CD/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PCE/"
"emulators/RetroArch/_base_/RetroArch/@ROM/POKE MINI/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PS1 hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PS1/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PS2 hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/PS2/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SFC hack/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SFC-MSU1/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SFC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SMS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SS plus/"
"emulators/RetroArch/_base_/RetroArch/@ROM/SS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/Virtual Boy/"
"emulators/RetroArch/_base_/RetroArch/@ROM/WII Ware/"
"emulators/RetroArch/_base_/RetroArch/@ROM/WS/"
"emulators/RetroArch/_base_/RetroArch/@ROM/WSC/"
"emulators/RetroArch/_base_/RetroArch/@ROM/psp/"
"emulators/RetroArch/_base_/RetroArch/CSV/"
"emulators/RetroArch/_base_/RetroArch/thumbnails/"
)


# 创建或清空 temp.txt 文件以存储错误信息
> temp.txt

# 初始化计数器和总大小
total_files=0
total_size=0

# 记录脚本开始时间
start_time=$SECONDS

# 遍历路径数组
for path in "${paths[@]}"; do
  # 记录当前路径处理开始时间
  path_start_time=$SECONDS

  # 计算当前路径的文件数和大小
  files=$(find "$path" -type f | wc -l)
  size=$(find "$path" -type f -exec du -b {} + | awk '{sum+=$1} END {print int(sum/1024/1024)}')

  # 更新总计数器和总大小
  total_files=$((total_files + files))
  total_size=$((total_size + size))

  # 提取路径中的 ROM 类型作为提交信息的一部分
  rom_type=$(basename "$path")

  # 执行 git annex add 命令，如果失败则记录错误
  if ! git annex add "$path"; then
    echo "Failed to add $path at $(($SECONDS - path_start_time)) seconds" >> temp.txt
    continue
  fi

  # 执行 git commit 命令，如果失败则记录错误
  if ! git commit -m "Add $rom_type - Files: $files, Size: ${size}MB, Duration: $(($SECONDS - path_start_time))s"; then
    echo "Failed to commit $rom_type at $(($SECONDS - path_start_time)) seconds" >> temp.txt
    continue
  fi
done

# 记录脚本结束时间
end_time=$SECONDS

# 检查 temp.txt 文件是否为空，如果不为空则打印错误信息
if [ -s temp.txt ]; then
  echo "Some commands failed. Check temp.txt for details."
else
  echo "All commands executed successfully."
fi

# 打印总文件数、总大小和总耗时
echo "Total files: $total_files"
echo "Total size: $total_size MB"
echo "Total duration: $((end_time - start_time)) seconds."