#set scheduler-locking on
#set follow-fork-mode parent
#set follow-fork-mode child
#set detach-on-fork on
#i sharedlibrary #info sharedlibrary
#i threads
#ulimit -c unlimited
#echo "/tmp/core/%e-%p-%t.core" > /proc/sys/kernel/core_pattern
#echo "2" > /proc/sys/fs/suid_dumpable
#dump [format] memory filename start_addr end_addrdump [format] value

set print pretty on
set print union on
set print elements 0
set print vtbl on
set print object on
set print sevenbit-strings off
set print demangle on
set pagination off
set logging enabled off
#set demangle-style gun-v3

set debug-file-directory $debugdir:$datadir/auto-load:/home/antmuse/debug

define saveb
save breakpoints bpos.cfg
end
document saveb
save breakpoints in file bpos.cfg
end

define loadb
source bpos.cfg
end
document loadb
load breakpoints from file bpos.cfg
end

define dpath
#set substitute-path from_path to_path
set dir .:..:../so:../app
set solib-search-path .:..:../bin:../lib
end


define cls
shell clear
end
document cls
Clears the screen with a simple command.
end


show debug-file-directory
