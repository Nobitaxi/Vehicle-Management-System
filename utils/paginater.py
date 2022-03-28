class Paginater():
    # 初始化函数
    def __init__(self, url_address, cur_page_num, total_rows, one_page_lines=6, page_maxtag=9):
        '''
        :param url_address: 需要分页功能的网页URL
        :param cur_page_num: 当前页码数
        :param total_rows: 数据模型的记录总数
        :param one_page_lines: 每页要显示多少条记录
        :param page_maxtag: 页面上要显示页码标签的个数
        '''
        self.url_address = url_address
        self.page_maxtag = page_maxtag
        '''
        根据总记录数计算出总页数
        通过divmod()函数取得商和余数，有余数时，总页数是商加1
        同时判断当前页的数值是否大于总页数
        如果大于总页数，设置当前页数等于最后一页的页数
        '''
        total_page, remainder = divmod(total_rows, one_page_lines)
        if remainder:
            total_page += 1
        self.total_page = total_page
        try:
            # 参数page传递的值是字符类型，因此需要转化为整数类型
            cur_page_num = int(cur_page_num)
            # 如果当前页码超过了最大的页码，设置当前页码是最后一页的页码
            if cur_page_num > total_page:
                cur_page_num = total_page
            # 避免出现当前页码为0
            if cur_page_num == 0:
                cur_page_num = 1
        except Exception as e:
            # 当输入的页码不是正整数或不是数字时，设置当前页码是第一页的页码
            cur_page_num = 1
        self.cur_page_num = cur_page_num
        # 定义两个变量，指定当前页的记录开始数，以及当前页的记录结束数
        self.rows_start = (cur_page_num-1) * one_page_lines
        self.rows_end = cur_page_num * one_page_lines
        # 如果总页数小于每页设置的页码标签数，设置每页页码标签数为总页数
        if total_page < page_maxtag:
            page_maxtag = total_page
        # 把当前页码标签放在中间，前面放一半页码标签，后面放一半页码标签
        # 因此先把页面上设置的页码标签除以2
        half_page_maxtag = page_maxtag // 2
        # 当前页面上页码标签的开始数
        page_start = cur_page_num - half_page_maxtag
        # 当前页面上页码标签的结束数
        page_end = cur_page_num + half_page_maxtag
        '''
        如果计算出的页码标签开始数小于1，页面中的页码标签设置为从1开始
        设置页面中页码标签结束数等于前面设置的页码标签总数page_maxtag
        '''
        if page_start <= 1:
            page_start = 1
            page_end = page_maxtag
        '''
        如果计算出的页码标签数比总页码数大，设置最后的页码标签数为总页数
        设置页面中页码标签开始数等于总页数减掉前面设置的页码标签数（page_maxtag)加1
        '''
        if page_end >= total_page:
            page_end = total_page
            page_start = total_page - page_maxtag + 1
            if page_start <= 1:
                page_start = 1
        self.page_start = page_start
        self.page_end = page_end
    # 生成分页的HTML代码
    def html_page(self):
        # 初始化一个列表对象，用来保存拼接分页的HTML代码
        html_page = []
        # 首页代码
        html_page.append('<li><a href="{}?page=1">首页</a></li>'.format(self.url_address))
        # 上一页页码标签的HTML代码，如果当前是第一页，设置上一页页码标签为非可用状态
        if self.cur_page_num <= 1:
            html_page.append('<li class="disabled"><a href="#"><span '
                             'aria-hidden="true">&laquo;</span></a></li>'.format(self.cur_page_num - 1))
        else:
            # 上一页页码标签的HTML代码
            html_page.append('<li><a href="{}?page={}"><span aria-hidden="true">&laquo;</span></a></li>'.format(
                self.url_address, self.cur_page_num - 1))
        # 依次取页码标签，注意切片函数的用法
        for i in range(self.page_start, self.page_end + 1):
            # 如果等于当前页就加一个active样式类
            if i == self.cur_page_num:
                tmp = '<li class="active"><a href="{0}?page={1}">{1}</a></li>'.format(self.url_address, i)
            else:
                tmp = '<li><a href="{0}?page={1}">{1}</a></li>'.format(self.url_address, i)
            html_page.append(tmp)
        # 下一页页码标签的HTML代码
        # 判断，如果是最后一页，下一页设为disabled
        if self.cur_page_num >= self.total_page:
            html_page.append('<li class="disabled"><a href="#"><span aria-hidden="true">&raquo;</span></a></li>')
        else:
            html_page.append('<li><a href="{}?page={}"><span aria-hidden="true">&raquo;</span></a></li>'.format(
                self.url_address, self.cur_page_num + 1))
        # 最后一页页码标签的HTML代码
        html_page.append('<li><a href="{}?page={}">尾页</a></li>'.format(self.url_address, self.total_page))
        # 把HTML连接起来
        page_nav = "".join(html_page)
        return page_nav
    # 把data_satrt()方法当作属性来用
    @property
    def data_start(self):
        return self.rows_start
    @property
    def data_end(self):
        return self.rows_end

