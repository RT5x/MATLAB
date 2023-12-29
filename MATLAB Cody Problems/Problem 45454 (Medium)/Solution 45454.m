function out = freq_word_2(str)
    punct = ["!", "?", ",", "."];
    str = split(erase(str, punct));
    n = length(str);
    
    cat_str = categorical(str);
    un = unique(cat_str);
    [~, idx] = max(countcats(cat_str));
    out = string(un(idx));

end
