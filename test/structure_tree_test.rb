# encoding: UTF-8
require 'test/unit'
require 'structure_tree'

module Inanna
  class TestStructureTreeBuilder <Test::Unit::TestCase
    SAMPLE_TEXT = 
    <<-eos
    第一卷 现代诗/新诗诞生的背景
    第一章 文学形式
    一个文学形式的诞生不是一两个文人偶尔为之，而是有其社会历史背景。如汉赋的诞生依托于汉帝国的强大，唐诗的繁荣立足于六朝俳赋和骈文，受到四声八病的影响，而古文在唐宋的复兴则是因唐代韩愈、柳宗元的古文运动还有北宋欧阳修等人对古文的大力倡导。
    第二章 现代诗
    而同样的，现代诗是在20世纪初胡适倡导的“白话文运动”下诞生的。白话文运动旨在让白话文成为通用的书面语，通过新文学来反对旧文学，提倡新道德去反对旧道德。胡适将其主张概括为四条：
    a.要有话说方才说话；
    b.有什么话说什么话，话怎么说就怎么说；
    c.要说我自己的话，别说别人的话；
    d.是什么时代的人，说什么时代话 
    第三章 白话文运动
    现代诗歌/新诗是这一整个“白话文运动”系统中的一个部分，而非凭空出现。
    到了近代，古典诗歌的形式早已经僵化，在章句用法上对作诗者有颇多限制，古典诗歌的形式早已经无法满足人们表达日常生活内容和情感的需要了，清人作诗唯一的特点就是从不出韵，但却无几首好诗，这就是文学形式僵化了。新诗的诞生其实是顺应了潮流。
    新诗本身就是对旧诗的一次否定式的突破——如果脱离了这个语境去对比现代诗和古典诗歌，那么新诗的地位会被严重低估。

    第二卷 现代诗的发展与积淀
    第一章 汉语的存在
    现代汉语的存在时间只有100年，而文言文从春秋战国开始已经有3000多年的历史。现代汉语中的优秀作品远不如用文言文所写出的作品多。 
    现代汉语的文化积淀太少。这还是和发展时间有关，我举非常简单的事例。从词汇上来说，说到“灞桥”“柳岸”，我们直接就会想到“离别”。谈论“鸿雁”就联想到“家书”，想到“乡愁”。 一个词汇就能联想到一个意象，甚至一个意境，还有一系列的诗词和事例。 这是几百年，几千年的文人通过各种的诗作积累下来沉淀到文字里的。而现代汉语中这样的词汇很少，戴望舒的“雨巷”“油纸扇下的姑娘”“丁香一样的姑娘”是一个不错的事例。 
    总得来说，现代汉语本身没有文化积淀，作诗者并不像古代诗人那样有很多的意境和意象词汇可供借鉴，这时候需要构筑一个好诗其实并不比做古诗简单。李贺之所以被称作“诗鬼”，除了他诗歌本身的风格很凄婉幽寂之外，就在于他构思不拘常法。
    第二章 新诗者
    而像是二十世纪初的那些做新诗者，受了古诗的影响，却又要跳离古诗的框架，本身就要这种“不拘常法”的能力，这是困难的。而读惯了文言文的人去写白话文的东西，这也是困难的。
    而如今的人要做白话诗，其实并不难，但要写好，也并不容易。
    至于有人说：
    现代诗当然有好诗，不过那却好像是极少数人，和极少数时段的事情。大多数现代诗还是如题所说啊。
    第三章 总结
    其实古代诗歌何尝不是如此？这句话依然可以这样说：“古诗当然有好诗，不过那却好像是极少数人，和极少数时段的事情”，这句话放到电影、音乐、美术等任何领域都是如此。
    之所以古代诗歌（这里特指近体诗）的好作品多，是因为它们已经发展了一千多年了，基数就大，好作品自然多。

    第三卷 对题主问题的逐一回应
    第一章 理科生的角度
    1、从一个理科生的角度来说，现代诗基本是由一堆乱来的语法、乱来的分段、不知所谓的词语和语句组成的。  
    语法的正确与否从来不是评价文学的标准。
    举例而言，比如：“春天花园里的花开得很美很茂盛”。——这是日常的表达方式，表达的对象是“花开得很茂盛”，语法正确。但是“春色满园关不住，一枝红杏出墙来 ”。——如果题主从现代汉语的角度看，恐怕也只能说是用“一堆乱来的语法”组成的。但是哪个好呢？不言而喻。
    其次，先前已经说过了，现代汉语的发展时间很短，现代诗的发展更短，很多现代诗歌其实是属于“试验产品”，但试验的成功与失败则是要由历史决断。新的文学风格是在不断地试错中成长与演变的，还需要读者的接受过程。一如电影蒙太奇的手法刚出来时并不为人们所理解，但如今已经被所有电影观众所接受。

    2、其实很多作家写的现代诗歌都是乱来的，窃以为他们本身都不一定知道他们自己的涂鸦是什么。 
    或许是，或许不是。大学里，我很多老师说的一句话可以用来做参考：现在，写诗的人越来越多，而读诗的人越来越少。
    而是否乱来，这个问题@张战有很好的表述了。
    第二章 我不之道

     3、包括舒婷在内的许多着名诗人在日常生活中都绝口不提诗歌，而他们写的常规体裁的生活文章在表达上往往很”正常“很幽默。  
    这句话无法作为论据。

    4、我所认识的，在文学界小有成绩的学生或者老师，绝大部分都坦诚：”现代诗其实就是一堆乱七八糟的表达的堆砌“。  
    这句话同样无法作为论据。

    5、本人很喜欢古代诗，所以也许对现代诗有意见，问题有些偏激，不过我是真的不明白，现代诗究竟在表达些神马。
    我有个朋友的现当代文学的老师曾经说过这么一句话，很多文学作品，你们看不懂、你们不觉得好，是因为你们你们还没有活到那个年纪，你们看得还不够多。
    第三章  艺术的敏感性
    这是审美力和对艺术的敏感性。
    最典型的可以看看你对于鲁迅的那句话的体验：“在我的后园，可以看见墙外有两株树，一株是枣树，还有一株也是枣树”。这句话到底好在哪里？如果对于文字敏感，那么很快可以抓住一点，就是“空间感”，这样写，给读者的感觉是读者自己在慢慢环视着鲁迅的后园。直接写“我的后园有两颗枣树”，是不会有这种空间感的。
    这个问题在知乎上还有很多很棒的体验，可以看看：鲁迅“在我的后园，可以看见墙外有两株树，一株是枣树，还有一株也是枣树”妙在哪里？ 
    再来举例庞德那首很着名的《地铁车站》（杜运燮译）
    第四章 湿漉漉的黑色枝条
    人群中这些面孔幽灵一般显现；
    湿漉漉的黑色枝条上的许多花瓣。
    简单讲讲体会好了。这首诗歌本身就是一首很典型的“试验性诗歌”，庞德自己说的是“我发现这对我了摆脱那次在地铁的情感所造成的困境很有用。我写了一首30行的诗，然后销毁了，……6个月后，我写了一首比那首短……”，这首诗是意象主义诗歌对意象的精简。
    这首诗的普遍理解是：庞德在地铁车站看到了一对母女，母女俩的面庞给他的印象极其深刻，因而作了这首诗。 因为地铁的线路错综复杂，恰如一棵大树的枝干。 而这一对在黑压压的地铁里的母女，恰如那潮湿黑暗枝干上的美丽花瓣。而地铁站里的来来往往的人群被抽象为了如鬼魅般的幻影。
    但如果你有自己的审美力和敏感性就可以看出一些不一样的东西。
    第五章 阅读体验
    我简单谈谈自己的阅读体验：首先，这首诗就短小的两行，从字眼上来说，初入眼帘的人群、幽灵、湿漉漉以及黑色都给人一种阴冷的感觉。因此我一开始读这首诗的时候感觉整首诗的氛围就是压抑的。 地铁车站进出的人群，上下班的人群。 人群“像幽灵一般显现”，我理解为这里的人群作为一个整体出现，暗示着人散失了主体性。花朵依附于黑色的树枝，可比之于人依附于社会。这里的“黑色树枝”可以简单用“树枝”替代，但却使用了“黑色”的一词，在这个短小的诗歌里就显得意味深长了。整首诗在我的理解里就是作者通过地铁车站建构了一个异化的资本社会。
    第六章 示例

    实在读不懂，怎么办？——那就不读，从读得懂的开始读。新诗读不懂，就读古诗。
    这里贴一个很喜欢的诗人樊忠慰的两篇诗歌：
    《沙海》
    这无法游泳的海
    只能以驼铃解渴
    每一粒沙
    都是渴死的水
    《荒冢》
    我活着
    没有人爱
    死了
    该会碰见美女的魂
    隔世的美女
    趁天没亮
    快带上你的枯骨
    跟我回家

    第四卷 为什么新诗那么多人写？
    第一章 不知所谓
    题主的问题是：
    为什么现代诗多半是些表达得不知所谓的语句组合，却还是那么多人去写？
    先不说这句话的价值判断，单单是从逻辑的角度讲，这句话前后就没有联系。即使现代诗100%是表达得不知所谓的语句组合，是毫无用处的废物，也无法推断出写的人应该少吧？YY小说千篇一律毫无价值，为什么那么多人写呢？……是吧，同理的。
    真要回答为什么这么多人写，那么以下几点：
    但从作诗的角度而言，确实好写。
    第二章 语句组合
    与绘画音乐电影等艺术相比，发表、发布诗歌的门槛低，比其他文学作品发布的都低。
    如前所述，很多打乱的语句组合，本身是一种“试验性”的作品。
    有些人就是用现代诗歌来表达自己的情感，尽管这种表达的方式你无法理解，但是不代表别人不能理解，也不代表他写的时候不是真情流露。@胡鼎鑫在评论里提到，他其实也写一些 写一些自己不确定文体的类诗句，情绪想表达但不想让没有该情绪经验的人知道。这里其实就是故意设置了某种障碍来寻找能够理解的同类。
    确实有人在装逼。

    第五卷 各种关于人文学科的偏见
    第一章 现代诗歌
    这个部分与现代诗歌无关，但是不得不提。
    这种偏见我已经在很多地方以各种形式说过很多遍了。
    人文社科的话题因为本身准入门槛低，就造成了人人都可以谈论的现象。
    我们不会要求一个初中的学生去理解量子力学，但是当我们无法理解那些现代诗歌、现代绘画、意识流小说时，我们却往往先从外界去找原因。
    如果你不懂量子物理你会觉得很正常，因为你不曾学过大学物理。但如果你不懂意识流小说存在主义文学，你却会觉得不正常，尽管你不曾看过多少浪漫主义与现实主义的小说。高中生现在学习的还是两百年前的物理，那么你凭什么认为你可以理解现代文学的理论，欣赏现代文学的作品？
    有人又要说物理和文学无法类比了。这里的类比是说，你学习任何一件事物从来不可能从0立马掌握到100，就算古诗，一个都没学习过《静夜思》的人，那么也很难领会《长恨歌》的内涵。而在小说中，倒叙、插叙的手法还只是初级的运用，到了意识流小说、存在主义那里，这种技巧性的写作方法是插叙倒叙乱叙这些手法的升级版，不是一般的读者能够看得懂的，都需要大量的阅读做基础。
    而人家从作品中看出了一些不一样的东西的时候，有些人又一句“过度解读”扣上去，这种心态，又怎么能够读懂很多作品呢？
    至于所谓的古诗词，真的很好理解吗？我随便拿一篇柳永的词让你说个好在哪里，你说的出来吗？
    而人家从作品中看出了一些不一样的东西的时候，有些人又一句“过度解读”扣上去，这种心态，又怎么能够读懂很多作品呢？
    第二章 诗歌结构研究
    作家写自己的作品，作家花时间在自己的作品上，但作家们不需要花时间向别人解释他们写得是什么，如果有这个时间，他们可以写更多的作品，解释作品表达了什么从来不是作家的工作。作者们可以用更多的精力和时间去补充自己，写更多的作品。如果你看不懂，请去看你看得懂的作品，或者你可以批评他们写得东西是垃圾，但是他们没有义务解释给所有人他们表达的是什么，这不是他们的工作，也不是你的权利。
    物理学没有速成的方法，凭什么文学就有？ 
    所以，我还是那句话， 实在读不懂，怎么办？——那就不读，从读得懂的开始读。 因为不是你功底不行，就是这作品确实不是好作品，无论哪种情况，恐怕你都不应该花过多的时间在上面。 诗歌简单的读法入门，张战在回答里讲的非常详细，所以我就不论述了。更详细的，请参考布鲁克斯《精致的瓮 : 诗歌结构研究》。 
    古典作品都是在极力描绘美，现代的作品不一定要美，甚至追求丑。古典美早已发展到极致，所以有人推翻它另寻新路。因为现代作品摈弃了传统技法，门槛便降得很低，牛鬼蛇神都可以自称艺术家和诗人。因此欣赏现代作品的时候自己的判断力就尤为重要。   
    鉴赏力判断力的提升，除了多读作品之外，也不能缺少对美术史、文学史、电影史的阅读。
    起码要了解一种文学风格、文学体裁的诞生背景和发展脉络才能更好地阅读作品。
    eos

    def test_parse_one_level
      spec = StructureSpec.instance
      spec.load_specification(nil)
             
      stb = StructureTreeBuilder.instance
      book = StructureTreeNode.new(SAMPLE_TEXT)
      stb.parse_one_level 1, book

      assert_equal '    ', book.content
      assert_equal 5, book.children_count
      str = '第一卷 现代诗/新诗诞生的背景'
      assert_equal str, book.children[0].content[0, str.length]
      str = '第二卷 现代诗的发展与积淀'
      assert_equal str, book.children[1].content[0, str.length]
      str = '第三卷 对题主问题的逐一回应'
      assert_equal str, book.children[2].content[0, str.length]
      str = '第四卷 为什么新诗那么多人写？'
      assert_equal str, book.children[3].content[0, str.length]
      str = '第五卷 各种关于人文学科的偏见'
      assert_equal str, book.children[4].content[0, str.length]
    end

    def test_parse_levels_recursively
      spec = StructureSpec.instance
      spec.load_specification(nil)
 
      stb = StructureTreeBuilder.instance

      book = StructureTreeNode.new(SAMPLE_TEXT)
      stb.parse_levels_recursively spec.top_level, book

      assert_equal 5, book.children_count
      assert_equal 3, book.children[0].children_count
      assert_equal 3, book.children[1].children_count
      assert_equal 6, book.children[2].children_count
      assert_equal 2, book.children[3].children_count
      assert_equal 2, book.children[4].children_count

      str = '第四章 湿漉漉的黑色枝条'
      assert_equal str, book.children[2].children[3].content[0,str.length]

      assert_equal 1, book.children[0].level
      assert_equal 2, book.children[0].children[0].level

    end
  end
end