KIND2COLLNAME={
  # not all definitions has `D` anchors
  # in face `D`'s could be well understood as deftheorems
  # just like theorems
  "D"=>'definitions', #:: ABCMIZ_0:def 1
  # you have to look for `:: thesis: ` when seeing `E`
  "E"=>'lemma', #_before Lm1:
  "S" => 'schemes', #scheme :: RELSET_1:sch 1
  "T"=>'theorem', #:: ORDINAL2:48
}
KIND2DEFNAME= {
  #type2 mode is M while type 1 mode(cluster) is NM
  "G" => 'aggr', #aggr 
  "K" => 'func', #func 
  "L" => 'struct', #struct
  "U" => 'sel', #sel 
  "V" => 'attr',#attr
  "M" => 'mode', #mode 
  "NK" => 'synonym', #synonym 
  "NM" => 'mode',  #mode type of T is 
  "NR" => 'antonym_pred', #antonym x
  "NV" => 'antonym_attr', #antonym 
  "R" => 'pred', #pred
}
    
def collect_between(first, last)
  first == last ? [first] : [first, *collect_between(first.next, last)]
end

def find_or_insert(co,characteristic)
  doc = co.find_one(characteristic)
  doc ||= co.insert(characteristic)
  doc
end
def pos_to_instance(arg)
  # arg is like "abcmiz_0.html#V1"
  pos = arg.split('#')
  pos[0] = pos[0].split('.html')[0]
  article_id = @cached_art[pos[0]]
  if pos[1] =~ /^([a-zA-Z]+)(\d+)$/
  elsif pos[1] =~ /^([a-zA-Z]+)(\d+):(.*)$/
    #inside one proof
  else
    binding.pry
  end
  collection_name = 
  case $1
  when 'V'
  else
    binding.pry
  end
  return
end


def pos_to_type(arg)
  # arg is like "abcmiz_0.html#V1"
  pos = arg.split('#')
  pos[0] = pos[0].split('.html')[0]
  article_id = @cached_art[pos[0]]
  if pos[1] =~ /^([a-zA-Z]+)(\d+)$/
    return $1
  else
    return nil
  end
end

def div_handle
  
end