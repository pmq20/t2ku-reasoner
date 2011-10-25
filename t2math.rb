#!/usr/bin/env ruby
require 'rubygems'
require 'pry'
all=<<DOC
Let $G$ be a group,
    $e$ be the identity of $G$,
    $*$ be the binary operation of $G$.
Suppose that
    $x*x=e$ for all $x\in G$.
Prove that
    $G$ is commutative.
DOC
#all=ARGF.read
all=all.split(".")

all=all.collect{|item|item.strip}
vars=[]
premises=[]
conclusions=[]
all.each do |item|
binding.pry
