import os
import glob
from data import srdata

class SDR(srdata.SRData):
    def __init__(self, args, name='SDR', train=True, benchmark=False):
        super(SDR, self).__init__(
            args, name=name, train=train, benchmark=benchmark
        )

    def _set_filesystem(self, dir_data):
        super(SDR, self)._set_filesystem(dir_data)
        if self.train:
            self.dir_hr = os.path.join(self.apath, 'trainset/HR')
            self.dir_lr = os.path.join(self.apath, 'trainset/LR')
        else:
            self.dir_hr = os.path.join(self.apath, 'valset/HR')
            self.dir_lr = os.path.join(self.apath, 'valset/LR')
    
    def remove_unused(self, imgs_list):
        new_list = []
        for _, imgs in enumerate(imgs_list):
            if imgs[-8:-4] in ['0025', '0075']:
                new_list.append(imgs)
        return new_list

    def _scan(self):
        names_hr = sorted(
            glob.glob(os.path.join(self.dir_hr, '*' + self.ext[0]))
        )
        names_lr = [[] for _ in self.scale]
        for f in names_hr:
            filename, _ = os.path.splitext(os.path.basename(f))
            for si, s in enumerate(self.scale):
                names_lr[si].append(os.path.join(
                    self.dir_lr, 'X{}/{}{}'.format(
                        s, filename, self.ext[1]
                    )
                ))

        if not self.train:
            names_hr = self.remove_unused(names_hr)
            names_lr = [self.remove_unused(names) for names in names_lr]

        return names_hr, names_lr